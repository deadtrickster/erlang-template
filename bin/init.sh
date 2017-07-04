#!/bin/sh

NAME=${1:-$(basename $(pwd))}
ERLANG_MODULE_NAME=$(echo "$NAME" | sed 's/-/_/g')
ELIXIR_MODULE_NAME=$(echo "$ERLANG_MODULE_NAME" | sed 's/_\([a-z]\)/\U\1/g;s/^\([a-z]\)/\U\1/g')
find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/GIT_NAME/$NAME/g"
find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/APP_NAME/$ERLANG_MODULE_NAME/g"
find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/ELIXIR_MODULE/$ELIXIR_MODULE_NAME/g"
sed -i "s/APP_NAME/$ERLANG_MODULE_NAME/g" bin/increment-version
mv src/APP_NAME.app.src src/$ERLANG_MODULE_NAME.app.src
mv lib/APP_NAME.ex lib/$ERLANG_MODULE_NAME.ex
rm -rf ./.git
git init
git remote add origin git@github.com:deadtrickster/$NAME.git
rm ./bin/init.sh
./rebar3 edoc
git add .
git commit -m "initialized $1"

