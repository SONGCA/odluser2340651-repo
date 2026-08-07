FROM node:22-alpine

WORKDIR /usr/src/app

# OS 최신 보안 패치 적용
RUN apk update && apk upgrade --no-cache

COPY package*.json ./
RUN npm install

# 애플리케이션 파일 복사 시 node 사용자에게 소유권 부여
COPY --chown=node:node . .

# 💡 [핵심] root 대신 non-root 계정(node)으로 실행하도록 설정!
USER node

EXPOSE 3000
CMD ["node", "app.js"]