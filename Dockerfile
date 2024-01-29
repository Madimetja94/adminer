FROM postgres:9.6

# PostgreSQL environment variables
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=pass
ENV POSTGRES_DB=db

# Set up volumes
VOLUME ./gitignore/postgresql:/var/lib/postgresql/data

# Expose PostgreSQL port
EXPOSE 5432:5433

# -------------------------------------

FROM adminer:4.7.2

# Set preferred Adminer design
ENV ADMINER_DESIGN nette

# Enable plugins by default
ENV ADMINER_PLUGINS "dump-alter dump-json dump-zip dump-bz2 tables-filter"

# Install PostgreSQL extension for Adminer
USER root
RUN apk add --no-cache postgresql-dev
USER adminer
