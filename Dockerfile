FROM nginx:alpine

ADD ./conf/nginx.conf.template /etc/nginx/nginx.conf.template

ENV UPSTREAM 127.0.0.1
ENV PORT 3306

ENTRYPOINT envsubst '"$UPSTREAM" "$PORT"' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
