
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/02/2017 22:05:26
-- Generated from EDMX file: F:\Support\Ammu\TLog-master1102\TLog-master\TLog\Models\TLogModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SSAM];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[TL].[FK_Activity_ServiceLineFunction]', 'F') IS NOT NULL
    ALTER TABLE [TL].[Activity] DROP CONSTRAINT [FK_Activity_ServiceLineFunction];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[TL].[Activity]', 'U') IS NOT NULL
    DROP TABLE [TL].[Activity];
GO
IF OBJECT_ID(N'[TL].[ServiceLineFunction]', 'U') IS NOT NULL
    DROP TABLE [TL].[ServiceLineFunction];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Activities'
CREATE TABLE [dbo].[Activities] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ServiceLineFunctionID] int  NOT NULL,
    [Name] varchar(250)  NOT NULL,
    [Active] bit  NOT NULL
);
GO

-- Creating table 'ServiceLineFunctions'
CREATE TABLE [dbo].[ServiceLineFunctions] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(200)  NOT NULL,
    [Active] bit  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Activities'
ALTER TABLE [dbo].[Activities]
ADD CONSTRAINT [PK_Activities]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ServiceLineFunctions'
ALTER TABLE [dbo].[ServiceLineFunctions]
ADD CONSTRAINT [PK_ServiceLineFunctions]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ServiceLineFunctionID] in table 'Activities'
ALTER TABLE [dbo].[Activities]
ADD CONSTRAINT [FK_Activity_ServiceLineFunction]
    FOREIGN KEY ([ServiceLineFunctionID])
    REFERENCES [dbo].[ServiceLineFunctions]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Activity_ServiceLineFunction'
CREATE INDEX [IX_FK_Activity_ServiceLineFunction]
ON [dbo].[Activities]
    ([ServiceLineFunctionID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------