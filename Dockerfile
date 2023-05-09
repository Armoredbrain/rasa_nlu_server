FROM rasa/rasa:3.0.8-full

WORKDIR /app

COPY rasa /app

# -m models is omitted as it's default value
CMD [ "run" , "--enable-api" ]