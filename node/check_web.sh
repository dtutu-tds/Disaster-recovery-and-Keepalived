#!/usr/bin/env bash
PORT=80
DOCROOT="/var/www/localhost/htdocs/index.html"

# Проверяем порт
timeout 1 bash -c "</dev/tcp/127.0.0.1/$PORT" || exit 1

# Проверяем index.html
[[ -f "$DOCROOT" ]] || exit 1

exit 0
