#FROM nginx:alpine

#COPY javier_melo_angular_app /usr/share/nginx/html

#EXPOSE 80
FROM node:13.14.0-alpine as node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM httpd:2.4-alpine as apache
COPY --from=node /app/dist /usr/local/apache2/htdocs
EXPOSE 8080