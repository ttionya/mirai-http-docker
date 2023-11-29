FROM rockylinux/rockylinux:9.3.20231119

LABEL "repository"="https://github.com/ttionya/mirai-http-docker" \
  "homepage"="https://github.com/ttionya/mirai-http-docker" \
  "maintainer"="ttionya <git@ttionya.com>"

WORKDIR /mirai/

COPY script/install.sh /app/
COPY plugins/* /mirai/plugins/

RUN bash /app/install.sh

ENTRYPOINT ["/mirai/mcl", "-u"]
