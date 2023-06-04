FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget gnupg ca-certificates curl
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update && apt-get install -y google-chrome-stable
RUN apt-get install -y nodejs
COPY package-lock.json package-lock.json
COPY package.json package.json
RUN npm install .
COPY . .
CMD ["npm","start"]