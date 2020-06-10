CREATE TABLE PersonCreditCardLINK
(
    -- Person Credit Card VID
    PersonCreditCardVID BIGINT IDENTITY NOT NULL,
    -- Person VID
    PersonVID BIGINT NOT NULL,
    -- Credit Card VID
    CreditCardVID BIGINT NOT NULL,
    -- Primary index to Person Credit Card LINK
    PRIMARY KEY CLUSTERED (PersonCreditCardVID),
    -- Unique index to Person Credit Card LINK over PresenceConstraint over (Person, Credit Card in "Person uses Credit Card") occurs at most one time
    UNIQUE NONCLUSTERED (
                            PersonVID,
                            CreditCardVID
                        ),
    FOREIGN KEY (CreditCardVID) REFERENCES CreditCardHUB (CreditCardVID)
)

CREATE TABLE CreditCardHUB
(
    -- Credit Card VID
    CreditCardVID BIGINT IDENTITY NOT NULL,
    -- Credit Card has Credit Card ID
    CreditCardID BIGINT NOT NULL,
    -- Primary index to Credit Card HUB
    PRIMARY KEY CLUSTERED (CreditCardVID),
    -- Unique index to Credit Card HUB over PresenceConstraint over (Credit Card ID in "Credit Card has Credit Card ID") occurs at most one time
    UNIQUE NONCLUSTERED (CreditCardID)
)
GO

CREATE TABLE CreditCardSAT
(
    -- Credit Card VID
    CreditCardVID BIGINT NOT NULL,
    -- LoadDateTime
    LoadDateTime DATETIME,
    -- Credit Card has Card Number
    CardNumber VARCHAR(25) NOT NULL,
    -- Credit Card has Card Type
    CardType VARCHAR(50) NOT NULL,
    -- Credit Card has Exp Month
    ExpMonth TINYINT NOT NULL,
    -- Credit Card has Exp Year
    ExpYear SMALLINT NOT NULL,
    -- Primary index to Credit Card SAT
    PRIMARY KEY CLUSTERED (
                              CreditCardVID,
                              LoadDateTime
                          ),
    FOREIGN KEY (CreditCardVID) REFERENCES CreditCardHUB (CreditCardVID)
)
GO

CREATE TABLE config.linkload
(
    table_type NVARCHAR(255) NOT NULL,
    source_table NVARCHAR(255) NOT NULL,
    link_name NVARCHAR(255) NOT NULL
)