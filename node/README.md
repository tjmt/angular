# About This Image
Imagem customizada, herdada no node. 

Tem como objetivo conter todas as ferramentas necessárias para compilar, publicar, executar testes, coletar métricas e analisar o código pelo sonarqube.

### Ferramentas instaladas:
- google-chrome-stable
- sonar-scanner-cli
- gettext-base (envsubst)


## How to Use the Image

### dockerfile
```docker
FROM tjmt/node:10 as base
#Usar esse estágio para instalar ferramentas adicionais que seu projeto necessita.

FROM base as ci
WORKDIR /app
COPY package.json package-lock.json .npmrc ./
RUN npm ci
COPY . ./
EXPOSE 4200
ENTRYPOINT ["/entrypoint/entrypoint-ci.sh"]

FROM ci as publish
WORKDIR /app
RUN npm run build -- --aot=true --build-optimizer=true --optimization=true --prod --configuration=production --base-href=/ --output-path=www
RUN npm pack
RUN mkdir -p /app/package && mv *.tgz /app/package
```

