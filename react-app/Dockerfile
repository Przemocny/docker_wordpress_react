FROM node:lts

WORKDIR /usr/app
ENV PATH /app/node_modules/.bin:$PATH

RUN npm install yarn
RUN yarn add global serve create-react-app precompress

EXPOSE 3000