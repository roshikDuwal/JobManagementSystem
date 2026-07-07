using Microsoft.Extensions.Options;
using MySqlConnector;
using System.Data;

namespace JobManagementSystem.API.Configuration
{
    public sealed class DbConnectionFactory:IDbConnectionFactory
    {
        private readonly string _connectionString;
        public DbConnectionFactory(IOptions<DatabaseSettings> options)
        {
            _connectionString = options.Value.DefaultConnection;
        }
        
        public IDbConnection CreateConnection()
        {
            return new MySqlConnection(_connectionString);
        }
    }
}
