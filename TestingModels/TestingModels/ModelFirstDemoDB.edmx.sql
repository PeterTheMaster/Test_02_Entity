
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/22/2018 09:47:24
-- Generated from EDMX file: C:\Users\prodrilo\Source\Repos\Test_02_Entity2\TestingModels\TestingModels\ModelFirstDemoDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE prueba;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_StudentEnrollment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EnrollmentSet] DROP CONSTRAINT [FK_StudentEnrollment];
GO
IF OBJECT_ID(N'[dbo].[FK_CourseEnrollment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EnrollmentSet] DROP CONSTRAINT [FK_CourseEnrollment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO
IF OBJECT_ID(N'[dbo].[EnrollmentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EnrollmentSet];
GO
IF OBJECT_ID(N'[dbo].[CourseSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CourseSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [EnrollmentDate] datetime  NOT NULL
);
GO

-- Creating table 'EnrollmentSet'
CREATE TABLE [dbo].[EnrollmentSet] (
    [EnrollmentID] int IDENTITY(1,1) NOT NULL,
    [CourseID] nvarchar(max)  NOT NULL,
    [StudentID] nvarchar(max)  NOT NULL,
    [Grade] nvarchar(max)  NOT NULL,
    [StudentStudentID] int  NOT NULL,
    [CourseCourseID] int  NOT NULL
);
GO

-- Creating table 'CourseSet'
CREATE TABLE [dbo].[CourseSet] (
    [CourseID] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [UsuarioID] int IDENTITY(1,1) NOT NULL,
    [eMail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LogsUsuario'
CREATE TABLE [dbo].[LogsUsuario] (
    [LogUsuarioID] int IDENTITY(1,1) NOT NULL,
    [nivel] smallint  NOT NULL,
    [criciticidad] smallint  NOT NULL,
    [textoLog] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StudentID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentID] ASC);
GO

-- Creating primary key on [EnrollmentID] in table 'EnrollmentSet'
ALTER TABLE [dbo].[EnrollmentSet]
ADD CONSTRAINT [PK_EnrollmentSet]
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC);
GO

-- Creating primary key on [CourseID] in table 'CourseSet'
ALTER TABLE [dbo].[CourseSet]
ADD CONSTRAINT [PK_CourseSet]
    PRIMARY KEY CLUSTERED ([CourseID] ASC);
GO

-- Creating primary key on [UsuarioID] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([UsuarioID] ASC);
GO

-- Creating primary key on [LogUsuarioID] in table 'LogsUsuario'
ALTER TABLE [dbo].[LogsUsuario]
ADD CONSTRAINT [PK_LogsUsuario]
    PRIMARY KEY CLUSTERED ([LogUsuarioID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StudentStudentID] in table 'EnrollmentSet'
ALTER TABLE [dbo].[EnrollmentSet]
ADD CONSTRAINT [FK_StudentEnrollment]
    FOREIGN KEY ([StudentStudentID])
    REFERENCES [dbo].[Students]
        ([StudentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentEnrollment'
CREATE INDEX [IX_FK_StudentEnrollment]
ON [dbo].[EnrollmentSet]
    ([StudentStudentID]);
GO

-- Creating foreign key on [CourseCourseID] in table 'EnrollmentSet'
ALTER TABLE [dbo].[EnrollmentSet]
ADD CONSTRAINT [FK_CourseEnrollment]
    FOREIGN KEY ([CourseCourseID])
    REFERENCES [dbo].[CourseSet]
        ([CourseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseEnrollment'
CREATE INDEX [IX_FK_CourseEnrollment]
ON [dbo].[EnrollmentSet]
    ([CourseCourseID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------