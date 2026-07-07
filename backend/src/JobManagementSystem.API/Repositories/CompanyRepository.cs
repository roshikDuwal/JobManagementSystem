using Dapper;
using JobManagementSystem.API.Configuration;
using JobManagementSystem.API.Models;
using JobManagementSystem.API.Models.DTOs;
using System.Data;

namespace JobManagementSystem.API.Repositories
{
    public class CompanyRepository
    {
        private readonly IDbConnectionFactory _connectionFactory;

        public CompanyRepository(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<int> CreateCompanyAsync(CreateCompanyRequest request)
        {
            using var connection=_connectionFactory.CreateConnection();
            var sql = @"
             INSERT INTO Companies
                (
                    CompanyName,
                    CompanyEmail,
                    CompanyPhone,
                    Website,
                    LogoUrl,
                    Description,
                    Industry,
                    CompanySize
                )
                VALUES
                (
                    @CompanyName,
                    @CompanyEmail,
                    @CompanyPhone,
                    @Website,
                    @LogoUrl,
                    @Description,
                    @Industry,
                    @CompanySize
                );
                SELECT LAST_INSERT_ID();
            ";
            return await connection.ExecuteScalarAsync<int>(sql, request);
        }

        public async Task<IEnumerable<Company>> GetAllCompaniesAsync()
        {
            using var connection = _connectionFactory.CreateConnection();
            const string sql= @"
                SELECT
                    CompanyId,
                    CompanyName,
                    CompanyEmail,
                    CompanyPhone,
                    Website,
                    LogoUrl,
                    Description,
                    Industry,
                    CompanySize,
                    IsVerified,
                    IsActive,
                    CreatedAt,
                    UpdatedAt
                FROM Companies
                ORDER BY CompanyName;
            ";

            return await connection.QueryAsync<Company>(sql);
        }

        public async Task<Company?> GetCompanyByIdAsync(int companyId)
        {
            using var connection = _connectionFactory.CreateConnection();

            const string sql = @"
                SELECT
                    CompanyId,
                    CompanyName,
                    CompanyEmail,
                    CompanyPhone,
                    Website,
                    LogoUrl,
                    Description,
                    Industry,
                    CompanySize,
                    IsVerified,
                    IsActive,
                    CreatedAt,
                    UpdatedAt
                FROM Companies
                WHERE CompanyId = @CompanyId;
            ";
            var parameters = new DynamicParameters();

            parameters.Add("CompanyId", companyId,DbType.Int32);
            return await connection.QueryFirstOrDefaultAsync<Company>(sql, parameters);
        }

        public async Task<bool> UpdateCompanyAsync(int companyId, UpdateCompanyRequest request)
        {
            using var connection=_connectionFactory.CreateConnection();
            const string sql = @"
                UPDATE Companies
                SET
                    CompanyName = @CompanyName,
                    CompanyEmail = @CompanyEmail,
                    CompanyPhone = @CompanyPhone,
                    Website = @Website,
                    LogoUrl = @LogoUrl,
                    Description = @Description,
                    Industry = @Industry,
                    CompanySize = @CompanySize,
                    IsVerified = @IsVerified,
                    IsActive = @IsActive,
                    UpdatedAt = NOW()
                WHERE CompanyId = @CompanyId;
            ";
            var parameters = new DynamicParameters(request);
            parameters.Add("CompanyId", companyId, DbType.Int32);
            var rowsAffected = await connection.ExecuteAsync(sql, parameters);
            return rowsAffected > 0;
        }
    }
}
