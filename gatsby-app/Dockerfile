FROM node:lts

WORKDIR /usr/app
ENV PATH /app/node_modules/.bin:$PATH

RUN apt-get update
RUN apt-get install -y sudo

# RUN npm install --global yarn
RUN npm install --global gatsby-cli && gatsby telemetry --disable

EXPOSE 8000