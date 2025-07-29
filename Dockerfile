# Use a stable Node.js version compatible with most npm versions
FROM node:20-alpine as build

WORKDIR /app
COPY . /app

RUN npm install
RUN npm run build

# Use lightweight Nginx to serve the built app
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
