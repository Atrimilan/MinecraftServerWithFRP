# Local Minecraft server with FRP 

> See: [Fast Reverse Proxy (FRP)](https://github.com/fatedier/frp)

This project demonstrates how to expose a local Minecraft server using FRP and Docker. It assumes that you have a Linux VPS and a Windows PC running the Minecraft server.

## 1. Prerequisites

Edit [frpc/frpc.toml](frpc/frpc.toml) and [frps/docker-compose.yml](frps/docker-compose.yml) to match your needs (bind ports, proxy list, server IP address, etc).

Don't forget to specify the `serverAddr` of your VPS in [frpc/frpc.toml](frpc/frpc.toml);

Create a [secret.txt](secret.txt) file in the root directory, and fill it with a secure random alphanumeric string.

## 2. Configure FRPS - On the remote VPS

Open the TCP ports on your VPS firewall, based on what you have specified in [frps/docker-compose.yml](frps/docker-compose.yml).

Run FRPS (this simply runs a Docker container):
```sh
cd ./frps
sh ./run.sh
```

Listen to logs (Ctrl+C to exit):
```sh
docker logs frps -tf
```

## 3. Configure FRPC - On the Minecraft server host

Run [frpc/run.bat](frpc/run.bat) to run FRPC in a Docker container.

The container will stop on terminal exit (as it is not detached).

## 4. Set up the Minecraft server

Install the Minecraft server JAR file of your choice in the [mc_server](mc_server) directory, and adjust the JVM arguments in [mc_server/run.bat](mc_server/run.bat) to suit your needs.

Run [mc_server/run.bat](mc_server/run.bat) to start the Minecraft server. Remember to set the port in the generated [server.properties](mc_server/server.properties) file to match the port specified in [frpc/frpc.toml](frpc/frpc.toml).

## 5. Start everything easily

Once everything is ready, you can run [start_servers.bat](start_servers.bat) to start FRPC and the Minecraft server with a single click.
