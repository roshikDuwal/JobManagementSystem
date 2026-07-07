namespace JobManagementSystem.API.Models.DTOs
{
    public class CreateCompanyRequest
    {
        public string CompanyName { get; set; } = string.Empty;

        public string? CompanyEmail { get; set; }

        public string? CompanyPhone { get; set; }

        public string? Website { get; set; }

        public string? LogoUrl { get; set; }

        public string? Description { get; set; }

        public string? Industry { get; set; }

        public int? CompanySize { get; set; }
    }
}
