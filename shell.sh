#!/bin/sh

docker run -it --user $UID:$GID -v $(pwd)/rasa:/app rasa/rasa:3.0.8-full shell