# syntax=docker/dockerfile:1.4
FROM directus/directus:11.1.1
VOLUME ["/directus/database", "/directus/uploads"]
USER root
RUN corepack enable \
&& corepack prepare pnpm@8.7.6 --activate \
&& chown node:node /directus \
&& chown node:node /directus/database
RUN chmod -R 777 ./database
EXPOSE 8055
USER node
CMD : \
&& node /directus/cli.js bootstrap \
&& node /directus/cli.js start;