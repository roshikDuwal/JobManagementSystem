CREATE TABLE Educations
(
    EducationId INT AUTO_INCREMENT,
    UserId INT NOT NULL,

    InstitutionName VARCHAR(255) NOT NULL,
    Degree VARCHAR(150) NOT NULL,
    FieldOfStudy VARCHAR(150) NULL,

    StartDate DATE NULL,
    EndDate DATE NULL,

    Grade VARCHAR(50) NULL,
    Description TEXT NULL,

    IsCurrentlyStudying BOOLEAN NOT NULL DEFAULT FALSE,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_Educations
        PRIMARY KEY (EducationId),

    CONSTRAINT FK_Educations_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
        ON DELETE CASCADE
);

CREATE INDEX IX_Educations_UserId
    ON Educations(UserId);