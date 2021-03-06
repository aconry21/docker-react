FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .


RUN npm config set proxy apsrd01886.uhc.com
RUN npm config set registry http://apsrd01886.uhc.com:8081/repository/npm-production/
RUN npm install 
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
