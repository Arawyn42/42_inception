#!/bin/sh

openssl req -x509 -nodes -keyout ${KEY} -out ${CERT} -subj "/C=FR/ST=Perpignan/L=Perpignan/O=42/OU=drenassi/CN=drenassi@student.42perpignan.fr/UID=${USER}"

nginx -g "daemon off;"
