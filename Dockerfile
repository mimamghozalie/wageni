FROM alpine:3.15

RUN apk add --update nodejs yarn

WORKDIR /app

ENV NODE_ENV 'production'

COPY package.json ./

RUN yarn install --no-cache --production

COPY . .

EXPOSE 3333

CMD ["node","main.js"]