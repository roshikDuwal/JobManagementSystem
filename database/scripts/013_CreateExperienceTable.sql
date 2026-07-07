CREATE TABLE Experiences
(
    ExperienceId INT AUTO_INCREMENT,
    UserId INT NOT NULL,

    CompanyName VARCHAR(255) NOT NULL,
    JobTitle VARCHAR(255) NOT NULL,
    EmploymentType VARCHAR(100) NULL,
    Location VARCHAR(255) NULL,

    StartDate DATE NULL,
    EndDate DATE NULL,

    IsCurrentlyWorking BOOLEAN NOT NULL DEFAULT FALSE,

    Responsibilities TEXT NULL,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_Experiences
        PRIMARY KEY (ExperienceId),

    CONSTRAINT FK_Experiences_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
        ON DELETE CASCADE
);

CREATE INDEX IX_Experiences_UserId
    ON Experiences(UserId);