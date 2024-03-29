FROM ghcr.io/kubernetize/alpine-service-base:3.19.1

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    addgroup -g 15353 named && \
    adduser -G named -D -H -u 15353 named && \
    apk --no-cache add bind bind-dnssec-tools libcap && \
    setcap cap_net_bind_service+ep /usr/sbin/named && \
    apk --no-cache del libcap && \
    chown -R named:named /etc/bind

USER 15353

CMD ["/usr/sbin/named", "-f"]
