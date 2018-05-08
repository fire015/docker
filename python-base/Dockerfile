FROM python:3.6

RUN apt-get update && apt-get install -y \
		gcc \
		gettext \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install -r requirements.txt

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

EXPOSE 8000
