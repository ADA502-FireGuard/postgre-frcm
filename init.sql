CREATE USER firerisk WITH PASSWORD 'firerisk';

GRANT ALL PRIVILEGES ON DATABASE fireriskdb TO firerisk;

CREATE TABLE IF NOT EXISTS FireRiskData (
    Id SERIAL PRIMARY KEY,
    FireRisk FLOAT NOT NULL,
    Lon FLOAT NOT NULL,
    Lat FLOAT NOT NULL,
    Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Source TEXT,
    ExpirationDate TIMESTAMP DEFAULT (CURRENT_TIMESTAMP + INTERVAL '1 hour'),
    TimeToUpdate INTERVAL,
    NumberOfRequests INTEGER
);

CREATE TABLE IF NOT EXISTS SubscribedUser (
    Id SERIAL PRIMARY KEY,
    IP VARCHAR(15) NOT NULL,
    AuthenticationToken VARCHAR(100) NOT NULL,
    SubscribedDataId INTEGER REFERENCES FireRiskData(Id),
    UpdateInterval INTERVAL,
    SubscriptionStatus BOOLEAN
);
