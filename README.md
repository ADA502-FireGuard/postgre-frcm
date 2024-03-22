# postgres-frcm
FireRisk PostgreSQL DB in Docker with Adminer

[![asciicast](https://asciinema.org/a/Twysf3V2gQWLZXeDl7hzJLP2v.svg)](https://asciinema.org/a/Twysf3V2gQWLZXeDl7hzJLP2v)

## Access the DB
`Adminer` is set up to be accessible at `http://localhost:8888`. PostgreSQL and Adminer containers are bridged, so to access the DB you will need to use the DB container name. It should be `postgres-frcm_postgres_1`, but you can also find it through `docker ps`. 

Direct access from host to PostgreSQL DB is `localhost:5432`. You can use clients like `psql` or `DBeaver` for this. 

`psql -h localhost -d firerisk -U admin`