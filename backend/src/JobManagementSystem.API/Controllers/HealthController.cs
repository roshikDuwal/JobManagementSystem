using JobManagementSystem.API.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JobManagementSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthController : ControllerBase
    {

        private readonly HealthRepository _healthRepository;

        public HealthController(HealthRepository healthRepository)
        {
            _healthRepository = healthRepository;   
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var databaseTime = await _healthRepository.GetDatabaseTimeAsync();
            return Ok(new
            {
                Status = "Healthy",
                Application = "Job Management System API",
                Environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT"),
                Timestamp = DateTime.UtcNow,
                DatabaseTime = databaseTime
            });
        }
    }
}
