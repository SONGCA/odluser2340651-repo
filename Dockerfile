# 기존 node:20-alpine 대신 최신 알파인 이미지 사용 및 패키지 업데이트
FROM node:22-alpine

WORKDIR /usr/src/app

# OS 최신 보안 패치 적용 (libcrypto3 등 CRITICAL 제거)
RUN apk update && apk upgrade --no-cache

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
CMD ["node", "app.js"]