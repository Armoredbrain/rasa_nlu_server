# HOW TO

### Scripts

`./launch.sh` : Launch NLU server
`./train.sh` : Train bot with NLU config
`./shell.sh` : Launch shell to speak with your bot

#### Docker command lexique

- `-v $(pwd)/rasa:/app` : it will map volume from container folder `/app` to repository folder `/rasa`
- `rasa/rasa:3.0.8-full` : simply calling rasa specific image
- `init` : it will overwrite `/rasa` folder with `app/` folder from container
- `train` : will train bot using `rasa/data/nlu.yml` `rasa/data/stories.yml` `rasa/data/rules.yml` and create a new model in `rasa/models`
- `shell` : launch sanic server to speak with your bot and try out your setup

#

## If you want to build your own bot

Be carefull, this command should not be runned, it will overwrite all custom data from rasa folder
If you clone this repository you should have a `/rasa` folder. If it is not the case then simply create a rasa folder

`mkdir rasa` then follow **HOW TO** section

init rasa folder:
`docker run --user $UID:$GID -v $(pwd)/rasa:/app rasa/rasa:3.0.8-full init --no-prompt`

#

# API key

add `yesterdayIsTurfu` in `roboto_service` to be able to communicate with NLU server

#

# Documentation

[rasa http api](https://rasa.com/docs/rasa/pages/http-api/)
[rasa action](https://rasa.com/docs/action-server/sdk-actions)
[rasa install from docker](https://rasa.com/docs/rasa/docker/building-in-docker/#choosing-a-tag/)
[rasa action server](https://rasa.com/docs/action-server/)

## Helper server start

### Declare variable with container info

:warn: Should be run after sanic server is up

#### Get container id

idContainer=`docker ps -a | grep rasa/rasa:3.0.8-full | grep "Up " | cut -d" " -f 1`

#### Get container ip using container id

ipContainer=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${idContainer}`

#### Go inside container

`docker exec -it ${idContainer} /bin/bash`
