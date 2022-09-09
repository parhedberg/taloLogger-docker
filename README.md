# taloLogg-Docker
A dockerized version of taloLogg


*** Setup ***
Configure your setup in "taloLogger.conf" according to https://olammi.iki.fi/sw/taloLogger/howto.php

In docker-compose.yml set the correct serialport to be forwarded to the docker container.

*** Start container ***
Start the container with command 'docker-compose up -d' och 'docker compose up -d' if you use newer version.

If you have enabled xml och logfileoutput they will be written inside ./data folder.



*** To-Do ***
Get the taloLoggerGraph component up and running.