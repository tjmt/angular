ARG NGINX_VERSION
FROM nginx:${NGINX_VERSION:-1.17.4}

ARG TimeZone=America/Cuiaba
ARG Language=pt_BR
ARG Unicode=UTF-8

RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone
RUN apt-get update && \
    apt-get install -y locales locales-all curl --no-install-recommends && \
    locale-gen ${Language}.${Unicode} && \
    update-locale LANG=${Language}.${Unicode} 

ENV LANG ${Language}.${Unicode}
ENV LANGUAGE ${Language}

COPY default.conf /etc/nginx/conf.d/

COPY /entrypoint/ /entrypoint/
RUN chmod +x /entrypoint/entrypoint.sh

EXPOSE 80 443
ENTRYPOINT ["/entrypoint/entrypoint.sh"]