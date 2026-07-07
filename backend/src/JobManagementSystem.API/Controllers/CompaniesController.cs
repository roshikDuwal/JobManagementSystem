using JobManagementSystem.API.Models.DTOs;
using JobManagementSystem.API.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JobManagementSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        private readonly CompanyRepository _companyRepository;
        public CompaniesController(CompanyRepository companyRepository)
        {
            _companyRepository = companyRepository;
        }

        [HttpPost]
        public async Task<IActionResult> CreateCompany(CreateCompanyRequest request)
        {
            var companyId = await _companyRepository.CreateCompanyAsync(request);
            return CreatedAtAction(
                nameof(GetCompanyById),
                new {id=companyId},
                new
                {
                    CompanyId= companyId,
                    Message= "Company created successfully"
                }
                );
        }
        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetCompanyById(int id)
        {
            var company = await _companyRepository.GetCompanyByIdAsync(id);
            if (company is null) return NotFound(new{ Message = $"Company with Id {id} was not found."});
            return Ok(company);
        }

        [HttpGet]
        public async Task<IActionResult> GetCompanies()
        {
            var companies = await _companyRepository.GetAllCompaniesAsync();
            return Ok(companies);
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> UpdateCompany(int id,UpdateCompanyRequest request)
        {
            var updated = await _companyRepository.UpdateCompanyAsync(id, request);
            if (!updated) return NotFound(new {Message = $"Company with Id {id} was not found."});
            return NoContent();
        }

    }
}
