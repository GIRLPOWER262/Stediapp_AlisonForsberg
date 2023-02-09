From node:16.15.0 as build
WORKDIR /app
ENV PATH /app/node_modules/.bin$PATH
COPY package.json ./
# COPY package-lock.json ./        I don't need because I deleted so now it is commented out
RUN npm install
COPY . ./
RUN npm run test
# RUN nox eas-cli build --profile preview --platform android --non-interactive