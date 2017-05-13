#!/bin/sh

ELIXIR_MODULE_NAME=$(echo "$1" | sed 's/_\([a-z]\)/\U\1/g;s/^\([a-z]\)/\U\1/g')
find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/APP_NAME/$1/g"
find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/ELIXIR_MODULE/$ELIXIR_MODULE_NAME/g"
sed -i "s/APP_NAME/$1/g" bin/increment-version
mv src/APP_NAME.app.src src/$1.app.src
mv lib/APP_NAME.ex lib/$1.ex
rm -rf ./.git
git init
git remote add origin git@github.com:deadtrickster/$1.git
rm ./bin/init.sh
./rebar3 edoc
git add .
git commit -m "initialized $1"
