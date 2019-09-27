ARG NGINX_VERSION
FROM nginx:${NGINX_VERSION}

ARG TimeZone
ARG Language
ARG Unicode

RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone
RUN apt-get update && \
    apt-get install -y locales locales-all && \
    locale-gen ${Language}.${Unicode} && \
    update-locale LANG=${Language}.${Unicode}

ENV LANG ${Language}.${Unicode}
ENV LANGUAGE ${Language}

COPY default.conf /etc/nginx/conf.d/

COPY /entrypoint/ /entrypoint/
RUN chmod +x /entrypoint/entrypoint.sh