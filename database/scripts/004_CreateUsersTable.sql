-- =============================================
-- Project : Job Portal
-- Module  : Phase 2 - Module 2.4
-- File    : 004_CreateUsersTable.sql
-- Purpose : Create Users table
-- =============================================

USE JobPortal;

CREATE TABLE Users
(
    UserId INT NOT NULL AUTO_INCREMENT,
    RoleId INT NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    IsEmailVerified BOOLEAN NOT NULL DEFAULT FALSE,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    LastLoginAt DATETIME NULL,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_Users PRIMARY KEY (UserId),
    CONSTRAINT UQ_Users_Email UNIQUE (Email),
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
	CompanyId INT NULL,
    CONSTRAINT FK_Users_Companies FOREIGN KEY (CompanyId) REFERENCES Companies(CompanyId)
);

