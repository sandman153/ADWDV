CREATE TABLE EmailAddressIsUsedByPersonLINK (
	-- Email Address Is Used By Person VID
	EmailAddressIsUsedByPersonVID           NVARCHAR(512) NOT NULL,
	-- FirstLoadDateTime
	FirstLoadDateTime                       DATETIME2 NULL,
	-- Email Address VID
	EmailAddressVID                         NVARCHAR(512) NOT NULL,
	-- Person VID
	PersonVID                               NVARCHAR(512) NOT NULL,
	-- Primary index to Email Address Is Used By Person LINK
	PRIMARY KEY CLUSTERED(EmailAddressIsUsedByPersonVID),
	-- Unique index to Email Address Is Used By Person LINK
	UNIQUE NONCLUSTERED(EmailAddressVID, PersonVID),
	FOREIGN KEY (EmailAddressVID) REFERENCES EmailAddressHUB (EmailAddressVID)
)
GO
