USE JobPortal;

-- ===========================================
-- Job Categories
-- ===========================================

INSERT INTO JobCategories (CategoryName)
VALUES
('Information Technology'),
('Finance'),
('Accounting'),
('Marketing'),
('Sales'),
('Human Resources'),
('Healthcare'),
('Engineering'),
('Education'),
('Customer Support');

-- ===========================================
-- Job Types
-- ===========================================

INSERT INTO JobTypes (JobTypeName)
VALUES
('Full-Time'),
('Part-Time'),
('Internship'),
('Contract'),
('Freelance'),
('Temporary');

-- ===========================================
-- Employment Types
-- ===========================================

INSERT INTO EmploymentTypes (EmploymentTypeName)
VALUES
('On-Site'),
('Remote'),
('Hybrid');

-- ===========================================
-- Experience Levels
-- ===========================================

INSERT INTO ExperienceLevels (ExperienceLevelName)
VALUES
('Fresher'),
('Junior'),
('Mid-Level'),
('Senior'),
('Lead'),
('Manager');