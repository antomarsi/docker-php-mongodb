#!/bin/bash

set -eo pipefail

declare -a versions=(
  7-apache
  7
)

for version in "${versions[@]}"
do
  rm -rf "$version"
  mkdir "$version"

  cat > "$version/Dockerfile" <<-END
# Generated automatically by update.sh
# Do no edit this file

FROM php:${version}

RUN apt-get update && apt-get install --yes --no-install-recommends \\
    libssl-dev

RUN pecl install mongodb \\
    && docker-php-ext-enable mongodb

RUN mkdir -p $PHP_INI_DIR/conf.d \\
    && echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini
END

done
