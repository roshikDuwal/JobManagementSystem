using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobManagementSystem.Application.Interfaces.Repositories
{
    public interface IHealthRepository
    {
        Task<DateTime> GetDatabaseTimeAsync();
    }
}
