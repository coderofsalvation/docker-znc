# ZNC

IRC bouncer based on Alpine Linux

## Quick Start

Run makeconf to initialize znc settings in a persistent docker volume:

    docker run --rm -it -v znc:/znc mantlepro/znc --makeconf --datadir /znc

Choose port 6697 and https when prompted. Once the initial configuration is complete, run your znc server:

    docker run -it -d --name znc -v znc:/znc -p 6697:6697 mantlepro/znc

Log into your znc container at https://localhost:6697 using the username and password chosen during setup. If logging into znc from a different machine outside of localhost, open port 6697 on the host machine.

## Weechat

Get the SHA512 fingerprint by running a temporary container with volumes from the znc container

    docker run --rm -it --volumes-from znc alpine cat /znc/znc.pem | openssl x509 -sha512 -fingerprint -noout | tr -d ':' | tr 'A-Z' 'a-z' | cut -d = -f 2

### Connect to ZNC using SSL:

    /server add <server-nickname> <docker_host>/6697 -ssl -username=<username>/<network> -password=<password> -autoconnect

    /set irc.server.<network>.ssl_fingerprint <SHA512_fingerprint>

    /connect znc

    /save

Pull requests are welcome, as are todos, bugs, and feature requests via github.
