#!/bin/sh

docker run --user $UID:$GID -v $(pwd)/rasa:/app rasa/rasa:3.0.8-full train --domain domain.yml --data data --out models
