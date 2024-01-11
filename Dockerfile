### STAGE 1: Définir le répertoire de travail ###
FROM node:20.0.0-alpine as build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: ###
FROM httpd:2.4-alpine
COPY --from=build /usr/src/app/dist/ng-crud-app/ /usr/local/apache2/htdocs/
