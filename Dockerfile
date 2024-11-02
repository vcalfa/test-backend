# syntax=docker/dockerfile:1.4
FROM directus/directus:11.1.1
VOLUME ["/directus/database", "/directus/uploads"]

ENV KEY='randomkey' \
    SECRET='randomsecret' \
    ADMIN_EMAIL='spencer@gmail.com' \
    ADMIN_PASSWORD='directus' \
    DB_CLIENT='sqlite3' \
    DB_FILENAME='/directus/database/data.db' \
    WEBSOCKETS_ENABLED=true

USER root
RUN corepack enable \
&& corepack prepare pnpm@8.7.6 --activate \
&& chown node:node /directus \
&& chown node:node /directus/database
RUN chmod -R 777 ./database
EXPOSE 8055
USER node
RUN chmod -R 777 ./database
CMD : \
&& node /directus/cli.js bootstrap \
&& node /directus/cli.js start;