FROM alpine:3.15

RUN apk add --update nodejs yarn chromium@edge

WORKDIR /app

ENV NODE_ENV 'production'\
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD 'true'\
    CHROME_BIN '/usr/bin/chromium-browser'

COPY package.json ./

RUN yarn install --no-cache --production

COPY . .

EXPOSE 3333

CMD ["node","main.js"]