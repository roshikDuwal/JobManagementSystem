using System.Data;

namespace JobManagementSystem.API.Configuration
{
    public interface IDbConnectionFactory
    {
        IDbConnection CreateConnection();
    }
}
