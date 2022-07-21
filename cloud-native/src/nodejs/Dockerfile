FROM node:12-alpine as build
WORKDIR /src
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
COPY ["./package*.json", "./tsconfig*.json", "./"]
COPY . .
RUN npm ci && npm run build

#Build Production stage
FROM node:12-alpine as production-build
#nstall dependencies for packages that require node-gyp support
RUN apk add --no-cache python make g++ 
WORKDIR /src
ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --only=production
# remove development dependencies
#RUN npm prune --production


#Build Final Production stage
FROM node:12-alpine as production
ENV NODE_ENV=production
WORKDIR /app
# we just need dist folder and node_modules to execute the command
COPY --chown=node:node --from=build src/dist /app
COPY --chown=node:node --from=production-build src/node_modules /app/node_modules
EXPOSE 4002
RUN chown -R node: /app
USER node
CMD ["node","index.js"]
