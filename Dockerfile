FROM alpine
MAINTAINER Josh Wheeler <mantlepro@gmail.com>
RUN apk add --update znc znc-extra znc-modperl znc-modpython znc-modtcl ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir /znc && chown -R znc:znc /znc
USER znc
ENTRYPOINT ["znc"]
CMD ["--foreground", "--datadir", "/znc"]
