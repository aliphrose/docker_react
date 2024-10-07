# 1. Use an official Node.js image as the base image
FROM node:14

# 2. Set the working directory inside the container
WORKDIR /src/app

COPY package*.json ./


RUN npm install


COPY . .

RUN npm run build


FROM nginx:alpine


COPY --from=0 /src/app/build /usr/share/nginx/html

EXPOSE 80

# 10. Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
