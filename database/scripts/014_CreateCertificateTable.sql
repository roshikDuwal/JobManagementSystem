CREATE TABLE Certifications
(
    CertificationId INT AUTO_INCREMENT,
    UserId INT NOT NULL,

    CertificationName VARCHAR(255) NOT NULL,
    IssuingOrganization VARCHAR(255) NOT NULL,

    IssueDate DATE NULL,
    ExpiryDate DATE NULL,

    CredentialId VARCHAR(255) NULL,
    CredentialUrl VARCHAR(500) NULL,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_Certifications
        PRIMARY KEY (CertificationId),

    CONSTRAINT FK_Certifications_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
        ON DELETE CASCADE
);

CREATE INDEX IX_Certifications_UserId
    ON Certifications(UserId);