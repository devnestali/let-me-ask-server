FROM node:23

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run db:migrate && npm run bd:seed

EXPOSE 3333

CMD ["npm", "start"]