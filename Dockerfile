FROM node:14.21.3
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g sequelize-cli
RUN npx sequelize db:create
RUN npx sequelize db:migrate
EXPOSE 5000
CMD ["npm","start"]
