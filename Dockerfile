FROM node:23

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Drizzle setup
RUN npm run db:migrate
RUN npm run db:seed

EXPOSE 3333

CMD ["npm", "start"]