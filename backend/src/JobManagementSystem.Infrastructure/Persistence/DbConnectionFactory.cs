
using JobManagementSystem.Application.Interfaces.Persistence;
using JobManagementSystem.Infrastructure.Configurations;
using Microsoft.Extensions.Options;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobManagementSystem.Infrastructure.Persistence
{
    public sealed class DbConnectionFactory : IDbConnectionFactory
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
