FROM FROM node:14-alpine
RUN mkdir -p /app
WORKDIR /app
COPY package*.json /app/
RUN npm install 
COPY . /app/
EXPOSE 3030
CMD ["npm", "run", "start"]