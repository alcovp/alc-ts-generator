#!/bin/bash
mkdir $1
cd $1
yarn --yes init
yarn add @types/node typescript 
yarn add -D ts-node
yarn tsc --init --rootDir src --outDir ./bin --esModuleInterop --lib ES2019 --module commonjs --noImplicitAny true
mkdir src
echo "console.log('Hello World\!\!\!')" > src/app.ts
npx --yes json -I -f package.json -e "this.scripts={\"build\": \"tsc\",\"start\": \"node ./bin/app.js\",\"dev\": \"ts-node ./src/app.ts\"}"
#TODO add .gitignore, add .env and install dotenv, ask about cli/deploy.sh, ask about install telegraf and add bot.ts