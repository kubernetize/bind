FROM ghcr.io/kubernetize/alpine-service-base

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add bind bind-dnssec-tools

CMD ["/usr/sbin/named", "-f"]
