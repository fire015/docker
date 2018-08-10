FROM python:3.6

RUN apt-get update && apt-get install -y \
		gcc \
		gettext \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

EXPOSE 8000
