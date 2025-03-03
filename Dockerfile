FROM debian:bookworm-20250203
RUN apt update

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install PostgreSQL and some useful extras
#RUN apt-get update && \
RUN apt install -y postgresql postgresql-contrib
    #rm -rf /var/lib/apt/lists/*

# (Optional) If you want to change PostgreSQL’s default settings, you can
# either edit the configuration files in /etc/postgresql/15/main or supply
# command-line options when starting postgres.

# Expose the default PostgreSQL port so that it’s accessible from outside the container.
EXPOSE 5432

# Switch to the "postgres" user (this is the default user created by the package)
#USER postgres

RUN echo "listen_addresses='*'" >> /etc/postgresql/postgresql.conf.sample && \
    echo "user='root'" >> /etc/postgresql/postgresql.conf.sample

# Expose PostgreSQL port
EXPOSE 5432

# Run PostgreSQL as root (force root execution)
CMD ["/usr/lib/postgresql/15/bin/postgres", "-D", "/var/lib/postgresql/15/main", "-c", "listen_addresses='*'", "-c", "superuser_reserved_connections=0"]

#RUN /usr/lib/postgresql/15/bin/initdb -D /var/lib/postgresql/15/main

# By default, Debian’s PostgreSQL cluster is created at /var/lib/postgresql/15/main.
# Start PostgreSQL in the foreground so that Docker can manage the process.
#CMD ["/usr/lib/postgresql/15/bin/postgres", "-D", "/var/lib/postgresql/15/main", "-c", "listen_addresses='*'"]
#CMD ["su", "postgres", "-c", "/usr/lib/postgresql/15/bin/postgres -D /var/lib/postgresql/15/main -c listen_addresses='*'"]
#CMD ["/usr/lib/postgresql/15/bin/postgres", "-D", "/var/lib/postgresql/15/main", "--allow-root"]


#CMD ["bash", "/veld/code/run.sh"]

#RUN apt install -y python3=3.11.2* python3-pip=23.0.1*

