# About This Image
Imagem customizada, herdada no nginx.

Tem como objetivo executar uma aplicação angular que está configurada para utilizar `config.json` ao  invés de `environment.ts`.

O entrypoint vai substituir as variaveis (usando `envsubst`) do arquivo:
* `/usr/share/nginx/html/assets/config/config-docker.json`.
* Gerando um novo arquivo `/usr/share/nginx/html/assets/config/config.json` pronto para o ambiente. 

Exemplo:
* `config-docker.json`
```json
{
  "name": "${NAME}",
  "production": "${PRODUCTION}",
  "api": {
    "url": "${API_URL}"
  },
  "authentication": {
    "authority": "${AUTH_AUTHORITY}",
    "client_id": "${AUTH_CLIENT_ID}",
    "client_uri": "${AUTH_APP_URL}",
    "scope": "${AUTH_SCOPE}"
  }
}
```


## How to Use the Image

* Copiar os arquivos gerados pelo `npm run build` para dentro da pasta `/usr/share/nginx/html/`


### dockerfile
```docker
FROM tjmt/nginx:1.17.4 AS runtime
COPY --from=publish /app/www/ /usr/share/nginx/html/
```

### dockercompose.yml
```yml
version: '3.5'

services:
  app-tjmt-jus-br:
    image: tjmt/nginx:1.17.4
    ports:
      - 80:80
      - 443:443
    environment:
      NAME: 'nome'
      AUTH_APP_URL: 'app.tjmt.jus.br'
      API_URL: 'app-api.tjmt.jus.br'
      AUTH_AUTHORITY: 'https://idp.tjmt.jus.br'
      AUTH_CLIENT_ID: '0000'
      AUTH_SCOPE: 'openid profile email roles offline_access'
```

