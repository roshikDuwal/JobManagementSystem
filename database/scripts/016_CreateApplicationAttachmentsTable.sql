CREATE TABLE ApplicationAttachments
(
    AttachmentId INT AUTO_INCREMENT,

    ApplicationId INT NOT NULL,

    AttachmentType VARCHAR(50) NOT NULL,

    FileName VARCHAR(255) NOT NULL,

    FileUrl VARCHAR(500) NOT NULL,

    ContentType VARCHAR(100) NOT NULL,

    FileSize BIGINT NOT NULL,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_ApplicationAttachments
        PRIMARY KEY (AttachmentId),

    CONSTRAINT FK_ApplicationAttachments_Applications
        FOREIGN KEY (ApplicationId)
        REFERENCES Applications(ApplicationId)
        ON DELETE CASCADE
);

CREATE INDEX IX_ApplicationAttachments_ApplicationId
ON ApplicationAttachments(ApplicationId);

CREATE INDEX IX_ApplicationAttachments_AttachmentType
ON ApplicationAttachments(AttachmentType);