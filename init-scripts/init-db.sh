#!/bin/bash

# This script initializes the PostgreSQL database with
# a firerisk user and firerisk database structure. 

set -e # Exit if a command returns a non-zero status.

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	\connect firerisk;

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

	\q
EOSQL
