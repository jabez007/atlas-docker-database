FROM postgres:alpine

# Build Postgres database
# Step 1: Copy the entire project structure to a temporary directory in the container
ADD . /home/postgres/tmp/

WORKDIR /home/postgres

# Step 2: Concatenate the table schema into the _baseline.sql for each database
RUN for dir in tmp/*/; do \
  if [ -d "$dir/schema" ]; then \
    for file in "$dir/schema/"*.sql; do \
      cat "$file" >> "$dir/_baseline.sql"; \
      echo "" >> "$dir/_baseline.sql"; \
    done; \
  fi; \
done

# Step 3: Move the concatenated _baseline.sql files to /docker-entrypoint-initdb.d
RUN for db in tmp/*/; do \
  if [ -f "$db/_baseline.sql" ]; then \
    db_name=$(basename "$db"); \
    mv "$db/_baseline.sql" /docker-entrypoint-initdb.d/"${db_name}_baseline.sql"; \
  fi; \
done

# Step 4: Clean up temporary directory
RUN rm -rf ./tmp

# Seed Postgres databse 
ADD ./**/sql/data/**/*.sql /docker-entrypoint-initdb.d

#
RUN if [ -n "$(find /docker-entrypoint-initdb.d/ -type f)" ]; then \
  chmod a+r /docker-entrypoint-initdb.d/*; \
  fi
