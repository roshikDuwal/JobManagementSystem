using FluentValidation;
using JobManagementSystem.Application.Abstractions.Repositories;
using JobManagementSystem.Application.Companies.Validators;
using JobManagementSystem.Application.Interfaces.Persistence;
using JobManagementSystem.Application.Interfaces.Repositories;
using JobManagementSystem.Infrastructure.Configurations;
using JobManagementSystem.Infrastructure.Persistence;
using JobManagementSystem.Infrastructure.Repositories;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);



// Add services to the container.
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();
builder.Services.AddControllers();
builder.Services.Configure<DatabaseSettings>(builder.Configuration.GetSection(DatabaseSettings.SectionName));
builder.Services.AddValidatorsFromAssemblyContaining<CreateCompanyRequestValidator>();
builder.Services.AddValidatorsFromAssemblyContaining<UpdateCompanyRequestValidator>();
builder.Services.AddScoped<IDbConnectionFactory, DbConnectionFactory>();
builder.Services.AddScoped<IHealthRepository, HealthRepository>();
builder.Services.AddScoped<ICompanyRepository,CompanyRepository>();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Job Management System API",
        Version = "v1",
        Description = "Production-ready Job Management System API built with ASP.NET Core"
    });
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.UseSwagger();

    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "Job Management System API V1");
    });
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

