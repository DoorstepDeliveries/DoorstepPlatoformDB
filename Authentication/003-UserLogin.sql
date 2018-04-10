--------------------------------------------------------------------------------
-- Membership Database Schema
-- https://github.com/membership/membership.db
--
-- Copyright © 2016 Membership Database contributors.
--
-- This source code is licensed under the MIT license found in the
-- LICENSE.txt file in the root directory of this source tree.
--------------------------------------------------------------------------------

CREATE TABLE [Authentication].[UserLogin]
(
  [Name]   NVARCHAR (50)    NOT NULL,
  [Key]    NVARCHAR (100)   NOT NULL,
  [UserId] UNIQUEIDENTIFIER NOT NULL,
  -- Keys
  CONSTRAINT [PK_UserLogin_Name_Key] PRIMARY KEY CLUSTERED ([Name] ASC, [Key] ASC),
  CONSTRAINT [FK_UserLogin_User] FOREIGN KEY ([UserId])
    REFERENCES [Authentication].[User] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);

GO
CREATE NONCLUSTERED INDEX [IX_UserLogin_UserId]
  ON [Authentication].[UserLogin] ([UserId] ASC);
