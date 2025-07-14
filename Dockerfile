FROM node:23

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .



EXPOSE 3333

CMD ["sh", "-c", "npm run db:migrate && npm run db:seed && npm start"]
