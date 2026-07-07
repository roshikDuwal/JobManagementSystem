-- =============================================
-- Project : Job Portal
-- Module  : Phase 2 - Module 2.8
-- File    : 010_CreateApplicationsTable.sql
-- Purpose : Create Applications table
-- =============================================

USE JobPortal;

CREATE TABLE Applications(
    ApplicationId INT NOT NULL AUTO_INCREMENT,
    JobId INT NOT NULL,
    UserId INT NOT NULL,
    -- =============================================
    -- Resume Information
    -- =============================================
    ResumeFileName VARCHAR(255) NOT NULL,
    ResumeFileUrl VARCHAR(500) NOT NULL,

    -- =============================================
    -- Cover Letter
    -- =============================================
    CoverLetter TEXT NULL,

    -- =============================================
    -- Employer Remarks (Internal Notes)
    -- =============================================

    EmployerRemarks TEXT NULL,

    -- =============================================
    -- Application Status
    -- =============================================

    Status ENUM
    ('Applied',
        'UnderReview',
        'Shortlisted',
        'InterviewScheduled',
        'InterviewCompleted',
        'Offered',
        'Rejected',
        'Withdrawn',
        'Hired'
    ) NOT NULL DEFAULT 'Applied',

    AppliedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME NULL,

    -- =============================================
    -- Constraints
    -- =============================================

    CONSTRAINT PK_Applications PRIMARY KEY (ApplicationId),
    CONSTRAINT FK_Applications_Jobs FOREIGN KEY (JobId) REFERENCES Jobs(JobId),
    CONSTRAINT FK_Applications_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
    CONSTRAINT UQ_Applications_Job_User UNIQUE (JobId, UserId)
);

-- =============================================
-- Indexes
-- =============================================

CREATE INDEX IX_Applications_JobId ON Applications(JobId);
CREATE INDEX IX_Applications_UserId ON Applications(UserId);
CREATE INDEX IX_Applications_Status ON Applications(Status);
CREATE INDEX IX_Applications_AppliedAt ON Applications(AppliedAt);