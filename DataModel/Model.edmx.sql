
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/10/2010 19:21:30
-- Generated from EDMX file: C:\Users\Dedrick\Documents\My Dropbox\Projects\DataViewer\DataModel\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DataSync];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[DataSyncModelStoreContainer].[FK_TaskMaster_Status]', 'F') IS NOT NULL
    ALTER TABLE [DataSyncModelStoreContainer].[TaskMaster] DROP CONSTRAINT [FK_TaskMaster_Status];
GO
IF OBJECT_ID(N'[adminTest].[FK_UserMaster_Status]', 'F') IS NOT NULL
    ALTER TABLE [adminTest].[UserMaster] DROP CONSTRAINT [FK_UserMaster_Status];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserMetaData]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserMetaDatas] DROP CONSTRAINT [FK_UserUserMetaData];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[DataSyncModelStoreContainer].[TaskMaster]', 'U') IS NOT NULL
    DROP TABLE [DataSyncModelStoreContainer].[TaskMaster];
GO
IF OBJECT_ID(N'[adminTest].[UserMaster]', 'U') IS NOT NULL
    DROP TABLE [adminTest].[UserMaster];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[UserMetaDatas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserMetaDatas];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Value] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserMetaDatas'
CREATE TABLE [dbo].[UserMetaDatas] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [StatusId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TaskMasters'
CREATE TABLE [dbo].[TaskMasters] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Detail] varchar(50)  NOT NULL,
    [StatusId] uniqueidentifier  NOT NULL,
    [CreatedDate] datetime  NULL,
    [Prority] varchar(50)  NULL,
    [UserId] uniqueidentifier  NULL
);
GO

-- Creating table 'UserMasters'
CREATE TABLE [dbo].[UserMasters] (
    [Id] uniqueidentifier  NOT NULL,
    [UserName] varchar(50)  NOT NULL,
    [StatusId] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserMetaDatas'
ALTER TABLE [dbo].[UserMetaDatas]
ADD CONSTRAINT [PK_UserMetaDatas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [Name], [Detail], [StatusId] in table 'TaskMasters'
ALTER TABLE [dbo].[TaskMasters]
ADD CONSTRAINT [PK_TaskMasters]
    PRIMARY KEY CLUSTERED ([Id], [Name], [Detail], [StatusId] ASC);
GO

-- Creating primary key on [Id] in table 'UserMasters'
ALTER TABLE [dbo].[UserMasters]
ADD CONSTRAINT [PK_UserMasters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StatusId] in table 'TaskMasters'
ALTER TABLE [dbo].[TaskMasters]
ADD CONSTRAINT [FK_TaskMaster_Status]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskMaster_Status'
CREATE INDEX [IX_FK_TaskMaster_Status]
ON [dbo].[TaskMasters]
    ([StatusId]);
GO

-- Creating foreign key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_Status_Status]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [StatusId] in table 'UserMasters'
ALTER TABLE [dbo].[UserMasters]
ADD CONSTRAINT [FK_UserMaster_Status]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserMaster_Status'
CREATE INDEX [IX_FK_UserMaster_Status]
ON [dbo].[UserMasters]
    ([StatusId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------