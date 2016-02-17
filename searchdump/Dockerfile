FROM raphiz/ubuntu-cron

RUN apt-get update && apt-get install -y python-pip npm && pip install awscli && npm install elasticdump -g && ln -s /usr/bin/nodejs /usr/bin/node

COPY cron.txt /etc/crontab
COPY backup.sh /root/backup.sh
RUN chmod 755 /root/backup.sh

ENV S3_BUCKET_NAME **DefineMe**
ENV AWS_ACCESS_KEY_ID **DefineMe**
ENV AWS_SECRET_ACCESS_KEY **DefineMe**
ENV AWS_DEFAULT_REGION eu-west-1
ENV BACKUP_NAME search