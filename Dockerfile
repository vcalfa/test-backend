# Use Directus as the base image
FROM directus/directus:11.1.1

# RUN mkdir -p /directus/database /directus/uploads

# Set environment variables (could also be specified when running the container)
ENV KEY='randomkey' \
    SECRET='randomsecret' \
    ADMIN_EMAIL='spencer@gmail.com' \
    ADMIN_PASSWORD='directus' \
    DB_CLIENT='sqlite3' \
    DB_FILENAME='/directus/database/data.db' \
    WEBSOCKETS_ENABLED=true

# copy ./database/ /directus
# copy ./uploads/ /directus

# VOLUME ["/directus/database", "/directus/uploads"]

# Expose the Directus default port
EXPOSE 8055

# Start Directus
#CMD ["directus", "start"]
