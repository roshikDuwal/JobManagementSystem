-- =============================================
-- Project : Job Portal
-- Module  : Phase 2 - Module 2.7
-- File    : 009_CreateJobsTable.sql
-- Purpose : Create Jobs table
-- =============================================

USE JobPortal;

CREATE TABLE Jobs(
    JobId INT NOT NULL AUTO_INCREMENT,
    CompanyId INT NOT NULL,
    JobCategoryId INT NOT NULL,
    JobTypeId INT NOT NULL,
    EmploymentTypeId INT NOT NULL,
    ExperienceLevelId INT NOT NULL,
    JobTitle VARCHAR(200) NOT NULL,
    JobLocation VARCHAR(150) NOT NULL,
    VacancyCount INT NOT NULL DEFAULT 1,
    SalaryMin DECIMAL(12,2) NULL,
    SalaryMax DECIMAL(12,2) NULL,
    IsSalaryNegotiable BOOLEAN NOT NULL DEFAULT FALSE,
    JobDescription TEXT NOT NULL,
    JobRequirements TEXT NULL,
    JobResponsibilities TEXT NULL,
    JobBenefits TEXT NULL,
    ApplicationDeadline DATE NOT NULL,
    IsFeatured BOOLEAN NOT NULL DEFAULT FALSE,
    IsUrgent BOOLEAN NOT NULL DEFAULT FALSE,
    Status ENUM('Draft','Published','Closed') NOT NULL DEFAULT 'Draft',
    ViewCount INT NOT NULL DEFAULT 0,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_Jobs PRIMARY KEY (JobId),
    CONSTRAINT FK_Jobs_Companies FOREIGN KEY (CompanyId) REFERENCES Companies(CompanyId),
    CONSTRAINT FK_Jobs_JobCategories FOREIGN KEY (JobCategoryId) REFERENCES JobCategories(JobCategoryId),
    CONSTRAINT FK_Jobs_JobTypes FOREIGN KEY (JobTypeId) REFERENCES JobTypes(JobTypeId),
    CONSTRAINT FK_Jobs_EmploymentTypes FOREIGN KEY (EmploymentTypeId) REFERENCES EmploymentTypes(EmploymentTypeId),
    CONSTRAINT FK_Jobs_ExperienceLevels FOREIGN KEY (ExperienceLevelId) REFERENCES ExperienceLevels(ExperienceLevelId),
	CONSTRAINT CHK_Jobs_Salary CHECK(
            SalaryMax IS NULL
            OR SalaryMin IS NULL
            OR SalaryMax >= SalaryMin
        )
);