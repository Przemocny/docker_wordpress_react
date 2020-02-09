FROM node:lts

WORKDIR /usr/app
ENV PATH /app/node_modules/.bin:$PATH

RUN npm install yarn
RUN npm install serve
RUN npm install react-scripts
RUN npm install precompress

EXPOSE 3000