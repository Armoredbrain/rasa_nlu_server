#!/bin/sh

if [ -z $AUTH_TOKEN ]
then
    AUTH_TOKEN="yesterdayIsTurfu"
fi

echo "Connecting..."
cd rasa/models

FILENAME=`ls -1tr *.tar.gz | tail -1`
cd - >/dev/null

docker run -it --user $UID:$GID -v $(pwd)/rasa:/app rasa/rasa:3.0.8-full run --enable-api --auth-token $AUTH_TOKEN -m models/$FILENAME
