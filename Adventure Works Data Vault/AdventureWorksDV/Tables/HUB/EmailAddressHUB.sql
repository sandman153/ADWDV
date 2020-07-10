CREATE TABLE EmailAddressHUB (
	-- Email Address VID
	EmailAddressVID                         NVARCHAR(512) NOT NULL,
	-- Email Address is used by Person that is a kind of Business Entity that has Business Entity ID
	BusinessEntityID                                BIGINT NOT NULL,
	-- Email Address has Email Address ID
	EmailAddressID                          BIGINT NOT NULL,
	-- Primary index to Email Address HUB
	PRIMARY KEY CLUSTERED(EmailAddressVID),
	-- Unique index to Email Address HUB over PresenceConstraint over (Person, Email Address ID in "Email Address is used by Person", "Email Address has Email Address ID") occurs at most one time
	UNIQUE NONCLUSTERED(BusinessEntityID, EmailAddressID)
)
GO