FROM alpine:edge

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    addgroup -g 15353 named && \
    adduser -G named -D -H -u 15353 named && \
    apk --no-cache add bind bind-dnssec-tools && \
    chown -R named:named /etc/bind

USER 15353

CMD ["/usr/sbin/named", "-f"]
