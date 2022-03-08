FROM node:17.6-alpine
RUN apk add --update tini
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 80
CMD ["/sbin/tini", "--", "node", "./dist/index.js"]
