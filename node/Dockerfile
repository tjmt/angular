ARG NODE_VERSION
FROM node:${NODE_VERSION} as base

#------Instalação/Configuração do Google chrome
RUN wget --no-check-certificate -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
#-----------------

#------Configuração NPM - Certificado
ENV NODE_TLS_REJECT_UNAUTHORIZED=0
RUN npm config set strict-ssl false
#-----------------


#------Instalação sonar-scanner-cli
ARG SONAR_SCANNER_NPM_VERSION
ARG SONAR_SCANNER_CLI_VERSION
ENV SONAR_SCANNER_FILE_NAME="sonar-scanner-cli-${SONAR_SCANNER_CLI_VERSION}-linux.zip"
ENV URL_SONAR_SCANNER="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_SCANNER_FILE_NAME}"
ENV PATH_NATIVE_SONAR_SCANNER="/root/.sonar/native-sonar-scanner"
RUN npm install -g sonarqube-scanner@${SONAR_SCANNER_NPM_VERSION}
WORKDIR ${PATH_NATIVE_SONAR_SCANNER}
RUN curl -sOSL -k --no-buffer ${URL_SONAR_SCANNER} && \
    unzip ${PATH_NATIVE_SONAR_SCANNER}/${SONAR_SCANNER_FILE_NAME} && \
    rm ${PATH_NATIVE_SONAR_SCANNER}/${SONAR_SCANNER_FILE_NAME}
#-----------------

#------Instalação envsubst
RUN apt-get update && \
    apt-get install gettext-base
#-----------------

COPY /entrypoint/ /entrypoint/
RUN chmod +x /entrypoint/entrypoint-ci.sh
ENTRYPOINT ["/entrypoint/entrypoint-ci.sh"]