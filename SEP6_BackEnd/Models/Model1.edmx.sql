
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/18/2021 16:05:15
-- Generated from EDMX file: C:\Users\Eric\Documents\GitHub\SEP6_BackEnd\SEP6_BackEnd\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SEP6_Movies];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_userLoginMovies_userLogin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[userLoginMovies] DROP CONSTRAINT [FK_userLoginMovies_userLogin];
GO
IF OBJECT_ID(N'[dbo].[FK_userLoginMovies_Movies]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[userLoginMovies] DROP CONSTRAINT [FK_userLoginMovies_Movies];
GO
IF OBJECT_ID(N'[dbo].[FK_commentsMovies]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comments] DROP CONSTRAINT [FK_commentsMovies];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Movies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Movies];
GO
IF OBJECT_ID(N'[dbo].[userLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[userLogins];
GO
IF OBJECT_ID(N'[dbo].[comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[comments];
GO
IF OBJECT_ID(N'[dbo].[userLoginMovies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[userLoginMovies];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Movies'
CREATE TABLE [dbo].[Movies] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'userLogins'
CREATE TABLE [dbo].[userLogins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [userName] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [listOfFavorites] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'comments'
CREATE TABLE [dbo].[comments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [text] nvarchar(max)  NOT NULL,
    [Movy_Id] int  NOT NULL
);
GO

-- Creating table 'userLoginMovies'
CREATE TABLE [dbo].[userLoginMovies] (
    [userLogins_Id] int  NOT NULL,
    [Movies_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Movies'
ALTER TABLE [dbo].[Movies]
ADD CONSTRAINT [PK_Movies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'userLogins'
ALTER TABLE [dbo].[userLogins]
ADD CONSTRAINT [PK_userLogins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [PK_comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [userLogins_Id], [Movies_Id] in table 'userLoginMovies'
ALTER TABLE [dbo].[userLoginMovies]
ADD CONSTRAINT [PK_userLoginMovies]
    PRIMARY KEY CLUSTERED ([userLogins_Id], [Movies_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [userLogins_Id] in table 'userLoginMovies'
ALTER TABLE [dbo].[userLoginMovies]
ADD CONSTRAINT [FK_userLoginMovies_userLogin]
    FOREIGN KEY ([userLogins_Id])
    REFERENCES [dbo].[userLogins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Movies_Id] in table 'userLoginMovies'
ALTER TABLE [dbo].[userLoginMovies]
ADD CONSTRAINT [FK_userLoginMovies_Movies]
    FOREIGN KEY ([Movies_Id])
    REFERENCES [dbo].[Movies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_userLoginMovies_Movies'
CREATE INDEX [IX_FK_userLoginMovies_Movies]
ON [dbo].[userLoginMovies]
    ([Movies_Id]);
GO

-- Creating foreign key on [Movy_Id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK_commentsMovies]
    FOREIGN KEY ([Movy_Id])
    REFERENCES [dbo].[Movies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_commentsMovies'
CREATE INDEX [IX_FK_commentsMovies]
ON [dbo].[comments]
    ([Movy_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------