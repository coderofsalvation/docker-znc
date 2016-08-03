# ZNC

IRC bouncer based on alpine

## Initial Configuration

    docker run --rm -it -v znc:/znc mantlepro/znc --makeconf --datadir /znc

Choose https and port 6697 when prompted.

Once the configuration is complete run your znc server

    docker run -it -d --name znc -v znc:/znc -p 6697:6697 znc

Log into znc at https://localhost:6697 using the username and password chosen during setup. Note, if logging into znc from a different machine outside of localhost, open port 6697 on the host machine.

## Weechat

First, get the SHA512 fingerprint.

    docker run --rm -it --volumes-from znc busybox cat /znc/znc.pem | openssl x509 -sha512 -fingerprint -noout | tr -d ':' | tr 'A-Z' 'a-z' | cut -d = -f 2

### Connect to ZNC using SSL:

    /server add znc <docker_host>/6697 -ssl -username=<username>/<network> -password=<password> -autoconnect

    /set irc.server.znc.ssl_fingerprint <SHA512_fingerprint>

    /save
    /connect znc
