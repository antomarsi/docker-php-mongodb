#!/bin/bash

set -eo pipefail

declare -a versions=(
  5-apache
  7-apache
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

RUN pecl install mongo \\
    && docker-php-ext-enable mongo
END

done
