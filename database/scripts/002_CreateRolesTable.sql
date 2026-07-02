-- =============================================
-- Project : Job Portal
-- Module  : Phase 2 - Module 2.3
-- File    : 002_CreateRolesTable.sql
-- Purpose : Create Roles table
-- =============================================

USE JobPortal;

CREATE TABLE Roles
(
    RoleId INT NOT NULL AUTO_INCREMENT,
    RoleName VARCHAR(50) NOT NULL,
    Description VARCHAR(255) NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_Roles PRIMARY KEY (RoleId),
    CONSTRAINT UQ_Roles_RoleName UNIQUE (RoleName)
);