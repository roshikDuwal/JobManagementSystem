USE JobPortal;

-- ===========================================
-- Job Categories
-- ===========================================

CREATE TABLE JobCategories(
    JobCategoryId INT NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_JobCategories PRIMARY KEY (JobCategoryId),
    CONSTRAINT UQ_JobCategories_CategoryName UNIQUE (CategoryName)
);

-- ===========================================
-- Job Types
-- ===========================================

CREATE TABLE JobTypes(
    JobTypeId INT NOT NULL AUTO_INCREMENT,
    JobTypeName VARCHAR(100) NOT NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_JobTypes PRIMARY KEY (JobTypeId),
    CONSTRAINT UQ_JobTypes_JobTypeName UNIQUE (JobTypeName)
);

-- ===========================================
-- Employment Types
-- ===========================================

CREATE TABLE EmploymentTypes(
    EmploymentTypeId INT NOT NULL AUTO_INCREMENT,
    EmploymentTypeName VARCHAR(100) NOT NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_EmploymentTypes PRIMARY KEY (EmploymentTypeId),
    CONSTRAINT UQ_EmploymentTypes_Name UNIQUE (EmploymentTypeName)
);

-- ===========================================
-- Experience Levels
-- ===========================================

CREATE TABLE ExperienceLevels(
    ExperienceLevelId INT NOT NULL AUTO_INCREMENT,
    ExperienceLevelName VARCHAR(100) NOT NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,
    CONSTRAINT PK_ExperienceLevels PRIMARY KEY (ExperienceLevelId),
    CONSTRAINT UQ_ExperienceLevels_Name UNIQUE (ExperienceLevelName)
);