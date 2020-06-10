CREATE TABLE [dbo].[PersonSAT](
	[PersonVID] [NVARCHAR](512) NOT NULL,
	[LoadDateTime] [DATETIME] NOT NULL,
	[NameStyle] [BIT] NULL,
	[EmailPromotion] [TINYINT] NOT NULL,
	[FirstName] [VARCHAR](50) NOT NULL,
	[LastName] [VARCHAR](50) NOT NULL,
	[PersonTypeCode] [CHAR](2) NULL,
	[AdditionalContactInfo] [VARCHAR](MAX) NULL,
	[Demographics] [VARCHAR](MAX) NULL,
	[MiddleName] [VARCHAR](50) NULL,
	[PasswordHash] [VARCHAR](128) NULL,
	[PasswordSalt] [VARCHAR](10) NULL,
	[Suffix] [VARCHAR](10) NULL,
	[Title] [VARCHAR](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonVID] ASC,
	[LoadDateTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) 
) 
GO

ALTER TABLE [dbo].[PersonSAT]  WITH CHECK ADD FOREIGN KEY([PersonVID])
REFERENCES [dbo].[PersonHUB] ([PersonVID])
GO

ALTER TABLE [dbo].[PersonSAT]  WITH CHECK ADD CHECK  (([EmailPromotion]>=(0) AND [EmailPromotion]<=(2)))
GO

ALTER TABLE [dbo].[PersonSAT]  WITH CHECK ADD CHECK  (([PersonTypeCode]='EM' OR [PersonTypeCode]='GC' OR [PersonTypeCode]='IN' OR [PersonTypeCode]='SC' OR [PersonTypeCode]='SP' OR [PersonTypeCode]='VC'))
GO

