FROM alpine
MAINTAINER Josh Wheeler <mantlepro@gmail.com>
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --update bitlbee bitlbee-facebook@testing znc znc-extra znc-modperl znc-modtcl ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir /znc && chown -R znc:znc /znc
USER znc
CMD ["/boot"]
