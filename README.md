# atlas-docker-database

## Build

`docker build -t atlas-docker-database .`

## Run

`docker run -d --env-file .env.postgres -p 5432:5432 -t ghcr.io/jabez007/atlas-docker-database`
