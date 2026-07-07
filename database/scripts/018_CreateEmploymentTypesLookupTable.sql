
CREATE TABLE `employmenttypes` (
    `EmploymentTypeId` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(100) NOT NULL,
    `IsActive` TINYINT(1) NOT NULL DEFAULT 1,
    `DisplayOrder` INT NOT NULL DEFAULT 0,
    `CreatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `UpdatedAt` DATETIME NULL DEFAULT NULL,

    PRIMARY KEY (`EmploymentTypeId`),
    UNIQUE KEY `UQ_EmploymentTypes_Name` (`Name`)
)