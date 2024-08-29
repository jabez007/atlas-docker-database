# atlas-docker-database

## Build

`docker build -t atlas-docker-database ./sql/postgres`

## Run

`docker run -d --env-file .env.postgres -p 5432:5432 -t ghcr.io/jabez007/atlas-docker-database:postgres`

## Generate Migration

```bash
atlas migrate diff --dir "file://sql/postgres/swapi/migrations" --to "file://sql/postgres/swapi/schema" --dev-url "docker+postgres://ghcr.io/jabez007/atlas-docker-database:postgres/swapi?search_path=public"
```
