using JobManagementSystem.Application.Companies.Commands;
using JobManagementSystem.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobManagementSystem.Application.Abstractions.Repositories
{
    public interface ICompanyRepository
    {
        Task<int> CreateCompanyAsync(CreateCompanyRequest request);
        Task<IEnumerable<Company>> GetAllCompaniesAsync();
        Task<Company?> GetCompanyByIdAsync(int companyId);
        Task<bool> UpdateCompanyAsync(int companyId, UpdateCompanyRequest request);
        Task<bool> DeleteCompanyAsync(int companyId);
    }
}
