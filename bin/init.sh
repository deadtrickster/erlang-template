#!/bin/sh

find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/APP_NAME/$1/g"
mv src/APP_NAME.app.src src/$1.app.src
rm -rf ./.git
git init
git remote add origin git@github.com:deadtrickster/$1.git
rm ./bin/init.sh
./rebar3 edoc
git add .
git commit -m "initialized $1"
