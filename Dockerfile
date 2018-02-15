FROM ruby:2.3-slim
# Instala dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick
# APP PATHH
ENV INSTALL_PATH /amigo_secreto
# cria diretorio
RUN mkdir -p $INSTALL_PATH
# path como diretório principal
WORKDIR $INSTALL_PATH
# copia gem file para dentro do container
COPY  Gemfile ./
# path para as Gems
ENV BUNDLE_PATH /box
# Copia codigo para dentro do container.
COPY . .
