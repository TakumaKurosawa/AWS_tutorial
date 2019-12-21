# コンテナイメージの指定
FROM node:11.14.0
# パッケージ管理用ファイルの転送
COPY . .
# コピーしたpackageファイルを用いてnpm installを走らせる　オプションは本番環境用
RUN yarn install \
  && yarn build

EXPOSE 3000
