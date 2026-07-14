using FluentValidation;
using JobManagementSystem.Application.Companies.Commands;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobManagementSystem.Application.Companies.Validators
{
    public sealed class UpdateCompanyRequestValidator:AbstractValidator<UpdateCompanyRequest>
    {
        public UpdateCompanyRequestValidator()
        {
            RuleFor(x => x.CompanyName)
                .NotEmpty()
                .WithMessage("Company Name is required")
                .MaximumLength(200);

            RuleFor(x => x.CompanyEmail)
                .EmailAddress()
                .When(x => !string.IsNullOrWhiteSpace(x.CompanyEmail));

            RuleFor(x => x.CompanyPhone)
                .MaximumLength(50);

            RuleFor(x => x.Website)
                .MaximumLength(255);

            RuleFor(x => x.Industry)
                .MaximumLength(150);

            RuleFor(x => x.CompanySize)
                .GreaterThan(0)
                .When(x => x.CompanySize.HasValue);
        }
    }
}
