FROM node:18-alpine AS builder

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

RUN npm run build

FROM node:18-alpine AS runner
COPY --from=builder /home/node/app/.output /home/node/app/.output

ENV NITRO_PORT 80
ENV NITRO_HOST 0.0.0.0

WORKDIR /home/node/app

EXPOSE 80
ENTRYPOINT ["node", "-C", "production", ".output/server/index.mjs"]
