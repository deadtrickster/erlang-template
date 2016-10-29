#!/bin/sh

find . \( -path ./bin -o -path ./.git \) -prune -o -type f -print0 | xargs -0 sed -i "s/APP_NAME/$1/g"
sed -i "s/erlang-template/$1/g" ./.git/config
mv src/APP_NAME.app.src src/$1.app.src

