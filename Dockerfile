FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install --registry=http://apsrd01886.uhc.com:8081/repository/npm-production/
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
