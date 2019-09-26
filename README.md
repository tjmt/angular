# About This Image
Imagem customizada, herdada no nginx. 

## How to Use the Image

### dockerfile
```docker
FROM tjmt/nginx:1.17.4 AS runtime
COPY /app/www/ /usr/share/nginx/html/
EXPOSE 80 443
ENTRYPOINT ["/entrypoint/entrypoint.sh"]
```

