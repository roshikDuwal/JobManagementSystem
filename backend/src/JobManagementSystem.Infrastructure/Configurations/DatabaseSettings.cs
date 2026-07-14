using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobManagementSystem.Infrastructure.Configurations
{
    public class DatabaseSettings
    {
        public const string SectionName = "ConnectionStrings";
        public string DefaultConnection { get; set; } = string.Empty;
    }
}
