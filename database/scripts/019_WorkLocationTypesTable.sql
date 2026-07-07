CREATE TABLE WorkLocationTypes
(
    WorkLocationTypeId INT AUTO_INCREMENT,

    Name VARCHAR(100) NOT NULL,

    IsActive BOOLEAN NOT NULL DEFAULT TRUE,

    DisplayOrder INT NOT NULL DEFAULT 0,

    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UpdatedAt DATETIME NULL DEFAULT NULL
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT PK_WorkLocationTypes
        PRIMARY KEY (WorkLocationTypeId),

    CONSTRAINT UK_WorkLocationTypes_Name
        UNIQUE (Name)
);