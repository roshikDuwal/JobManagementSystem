-- =============================================
-- Project : Job Portal
-- Module  : Phase 2 - Module 2.8
-- File    : 011_CreateSkillsTable.sql
-- Purpose : Create Junction (Job and Skill table
-- =============================================


CREATE TABLE Skills(
    SkillId INT AUTO_INCREMENT PRIMARY KEY,
    SkillName VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT UK_Skills_SkillName UNIQUE (SkillName)
);

CREATE TABLE JobSkills(
    JobId INT NOT NULL,
    SkillId INT NOT NULL,
    PRIMARY KEY (JobId, SkillId),
    CONSTRAINT FK_JobSkills_Jobs
        FOREIGN KEY (JobId)
        REFERENCES Jobs(JobId)
        ON DELETE CASCADE,
    CONSTRAINT FK_JobSkills_Skills
        FOREIGN KEY (SkillId)
        REFERENCES Skills(SkillId)
        ON DELETE CASCADE
);