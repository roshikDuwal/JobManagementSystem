using Dapper;
using JobManagementSystem.Application.Interfaces.Persistence;
using JobManagementSystem.Application.Interfaces.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobManagementSystem.Infrastructure.Repositories
{
    public sealed class HealthRepository:IHealthRepository
    {
        private readonly IDbConnectionFactory _connectionFactory;
        public HealthRepository(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<DateTime> GetDatabaseTimeAsync()
        {
            using var connection = _connectionFactory.CreateConnection();

            return await connection.ExecuteScalarAsync<DateTime>("SELECT NOW();");
        }
    }
}
