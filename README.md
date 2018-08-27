# docker-ptdefender

```console
docker run -d -p 6901:6901 -v ./${PATH_PROFIT_TRAILER}:/mnt/profittrailer -v ./ptdefender:/headless/.config/PTDefender --name ptdefender ptdefender
```

# Connect & Control
If the container is started like mentioned above, connect via one of these options:

* connect via __VNC viewer `localhost:5901`__, default password: `vncpassword`
* connect via __noVNC HTML5 full client__: [`http://localhost:6901/vnc.html`](http://localhost:6901/vnc.html), default password: `vncpassword` 
* connect via __noVNC HTML5 lite client__: [`http://localhost:6901/?password=vncpassword`](http://localhost:6901/?password=vncpassword) 


# Default password
vncpassword

# Docker-compose
File docker-compose.yml

```yml
version: '3'
services:
  pt01:
    image: but4ler/profit-trailer:2.1.5
    restart: always
    volumes:
      - ./bot2:/app/ProfitTrailer
      - ./entrypoint.sh:/entrypoint.sh
    ports:
      - "8081:8081/tcp"
    entrypoint: /entrypoint.sh
    network_mode: host

  ptdefender01:
    image: but4ler/docker-ptdefender:1.11.1
    volumes:
      - ./ptdefender:/headless/.config/PTDefender
      - ./bot2:/mnt/profittrailer
    ports:
      - "6901:6901/tcp"
    restart: always
    environment:
      - "VNC_PW=vncpassword"
    network_mode: host

```

```console
docker-compose up -d
```