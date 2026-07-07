using Dapper;
using JobManagementSystem.API.Configuration;

namespace JobManagementSystem.API.Repositories
{
    public sealed class HealthRepository
    {
        private readonly IDbConnectionFactory _connectionFactory;
        public HealthRepository(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<DateTime> GetDatabaseTimeAsync()
        {
            using var connection = _connectionFactory.CreateConnection();

            return await connection.ExecuteScalarAsync<DateTime>( "SELECT NOW();");
        }
    }
}
