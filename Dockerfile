FROM node:slim AS build

WORKDIR /usr/build
LABEL intermediate=true

# Allow us to use private NPM modules
ARG NPM_TOKEN
RUN echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc

# Install dependencies (including dev)
COPY package.json yarn.lock ./
RUN yarn --frozen-lockfile install

CMD ["node", "-e", "console.log('PRINTING FROM NODE')"]
