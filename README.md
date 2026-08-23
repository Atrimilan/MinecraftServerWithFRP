# Local Minecraft server with FRP 

> See: [Fast Reverse Proxy (FRP)](https://github.com/fatedier/frp)

This project is an example on how you can expose a local Minecraft server using FRP, with Docker.
It assumes that you have a Linux VPS, and a Windows PC running the Minecraft server.

## 1. Prerequisites

Edit [frpc/frpc.toml](frpc/frpc.toml) and [frps/docker-compose.yml](frps/docker-compose.yml) to match your needs (bind ports, proxy list, server IP address, etc).

Don't forget to specify the `serverAddr` of your VPS in [frpc/frpc.toml](frpc/frpc.toml);

Create a [secret.txt](secret.txt) file in the root directory, and fill it with a secured alphanumeric random string.

## 2. Configure FRPS (on the remote VPS)

Open the TCP ports on your VPS firewall, based on what you have specified in [frps/docker-compose.yml](frps/docker-compose.yml).

Run FRPS (this simply runs a docker container):
```sh
cd ./frps
sh ./run.sh
```

Listen to logs (CTLR + C to exit):
```sh
docker logs frps -tf
```

## 2. Configure FRPC (on the Minecraft server host)

Execute [frpc/run.bat](frpc/run.bat) to run FRPC in a docker container.

The container will stop on terminal exit (as it is not detached).

## 3. Minecraft server

Install the Minecraft server.jar of your choice in the [mc_server](mc_server) directory, and change JVM arguments in [mc_server/run.bat](mc_server/run.bat) according to your needs.

Execute [mc_server/run.bat](mc_server/run.bat) to start the Minecraft server, don't forget to change the port in the generated [server.properties](mc_server/server.properties) file according to what you have specified in [frpc/frpc.toml](frpc/frpc.toml).

## 4. Easy run

Everything is ready to go, now you can execute [start_servers.bat](start_servers.bat) to run FRPC and the Minecraft server with a single click.
