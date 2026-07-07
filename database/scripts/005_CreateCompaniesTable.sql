-- =============================================
-- Project : Job Portal
-- Module  : Phase 2 - Module 2.5
-- File    : 005_CreateCompaniesTable.sql
-- Purpose : Create Companies table
-- =============================================

USE JobPortal;

CREATE TABLE Companies
(
    CompanyId INT NOT NULL AUTO_INCREMENT,

    CompanyName VARCHAR(200) NOT NULL,

    CompanyEmail VARCHAR(255) NULL,

    CompanyPhone VARCHAR(50) NULL,

    Website VARCHAR(255) NULL,

    LogoUrl VARCHAR(500) NULL,

    Description TEXT NULL,

    Industry VARCHAR(150) NULL,

    CompanySize INT NULL,

    IsVerified BOOLEAN NOT NULL DEFAULT FALSE,

    IsActive BOOLEAN NOT NULL DEFAULT TRUE,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UpdatedAt DATETIME NULL,

    CONSTRAINT PK_Companies
        PRIMARY KEY (CompanyId),

    CONSTRAINT UQ_Companies_CompanyName
        UNIQUE (CompanyName)
);