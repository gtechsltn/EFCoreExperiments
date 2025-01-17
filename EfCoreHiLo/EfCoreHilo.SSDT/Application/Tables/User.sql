﻿CREATE TABLE [Application].[User](
    [UserID]                INT                                         CONSTRAINT [DF_Application_User_UserID] DEFAULT (NEXT VALUE FOR [Application].[sq_User]) NOT NULL,
    [FullName]              NVARCHAR(50)                                NOT NULL,
    [PreferredName]         NVARCHAR(50)                                NOT NULL,
    [IsPermittedToLogon]    BIT                                         NOT NULL,
    [LogonName]             NVARCHAR (256)                              NULL,
    [HashedPassword]        NVARCHAR (MAX)                              NULL,
    [RowVersion]            ROWVERSION                                  NULL,
    [LastEditedBy]          INT                                         NOT NULL,
    [ValidFrom]             DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]               DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY ([UserID]),
    CONSTRAINT [FK_User_LastEditedBy_User_UserID] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[User] ([UserID]),
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Application].[UserHistory]));