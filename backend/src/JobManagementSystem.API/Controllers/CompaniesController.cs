
using FluentValidation;
using JobManagementSystem.Application.Abstractions.Repositories;
using JobManagementSystem.Application.Companies.Commands;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JobManagementSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        private readonly ICompanyRepository _companyRepository;
        private readonly IValidator<CreateCompanyRequest> _validator;
        private readonly IValidator<UpdateCompanyRequest> _updateValidator;
        public CompaniesController(
            ICompanyRepository companyRepository,
            IValidator<CreateCompanyRequest> validator,
            IValidator<UpdateCompanyRequest> updateValidator)
        {
            _companyRepository = companyRepository;
            _validator = validator;
            _updateValidator = updateValidator;
        }

        [HttpPost]
        public async Task<IActionResult> CreateCompany(CreateCompanyRequest request)
        {
            var validationResult = await _validator.ValidateAsync(request);
            if (!validationResult.IsValid) return BadRequest(validationResult.Errors);

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
            var validationResult = await _updateValidator.ValidateAsync(request);
            if (!validationResult.IsValid) return BadRequest(validationResult.Errors);

            var updated = await _companyRepository.UpdateCompanyAsync(id, request);
            if (!updated) return NotFound(new {Message = $"Company with Id {id} was not found."});
            return NoContent();
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteCompany(int id)
        {
            var deleted = await _companyRepository.DeleteCompanyAsync(id);
            if (!deleted)
                return NotFound(new { Message = $"Company with ID {id} was not found" });
            return NoContent();
        }

    }
}
