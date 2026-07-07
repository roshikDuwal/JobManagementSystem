namespace JobManagementSystem.API.Models
{
    public class Company
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; } = string.Empty;
        public string? CompanyEmail { get; set; }
        public string? CompanyPhone { get; set; }
        public string? Website { get; set; }
        public string? LogoUrl { get; set; }
        public string? Description { get; set; }
        public string? Industry { get; set; }
        public int? CompanySize { get; set; }
        public bool IsVerified { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        }
}
