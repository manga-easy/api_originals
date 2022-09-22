FROM node:current-alpine3.16
WORKDIR /app
COPY package*.json ./

RUN npm install
RUN npm i -g @nestjs/cli
COPY . .
CMD ["npm", "run", "start:dev"]