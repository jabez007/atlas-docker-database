FROM postgres:alpine

# Build Postgres database
ADD ./**/sql/migrations/*.sql /docker-entrypoint-initdb.d

# Seed Postgres databse 
ADD ./**/sql/data/*.sql /docker-entrypoint-initdb.d

#
RUN if [ -n "$(find /docker-entrypoint-initdb.d/ -type f)" ]; then \
  chmod a+r /docker-entrypoint-initdb.d/*; \
  fi