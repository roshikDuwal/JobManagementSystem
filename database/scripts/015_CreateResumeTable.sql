CREATE TABLE Resumes
(
    -- =============================================
    -- Primary Key
    -- =============================================
    ResumeId INT AUTO_INCREMENT,
    -- =============================================
    -- Foreign Key
    -- =============================================
    UserId INT NOT NULL,
    -- =============================================
    -- Resume Information
    -- =============================================
    ResumeTitle VARCHAR(255) NOT NULL,
    FileName VARCHAR(255) NOT NULL,
    FileUrl VARCHAR(500) NOT NULL,
    ContentType VARCHAR(100) NOT NULL,
    FileSize BIGINT NOT NULL,
    IsDefault BOOLEAN NOT NULL DEFAULT FALSE,

    -- =============================================
    -- Audit Information
    -- =============================================
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

    -- =============================================
    -- Constraints
    -- =============================================
    CONSTRAINT PK_Resumes
        PRIMARY KEY (ResumeId),

    CONSTRAINT FK_Resumes_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
        ON DELETE CASCADE
);

-- =============================================
-- Indexes
-- =============================================

CREATE INDEX IX_Resumes_UserId
    ON Resumes(UserId);

CREATE INDEX IX_Resumes_IsDefault
    ON Resumes(IsDefault);