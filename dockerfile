#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY ./nginx/nginx.comf /etc/nginx/nginx.commf
COPY --from=node /app/dist/site-angular /usr/share/nginx/html