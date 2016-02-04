#!/bin/bash

cd /root

# Create timestamp file
: ${BACKUP_SUFFIX:=.$(date +"%Y-%m-%d-%H-%M-%S")}
readonly file=$BACKUP_NAME$BACKUP_SUFFIX.sql

# Dump databases
mysqldump -h $BACKUP_DB_HOST -u $BACKUP_DB_USER -p$BACKUP_DB_PASS --databases $BACKUP_DATABASES > $file

# Compress file
gzip -9 $file

# Upload to S3
aws s3 --region $AWS_DEFAULT_REGION cp $file.gz s3://$S3_BUCKET_NAME/backup/$file.gz --storage-class STANDARD_IA

# Remove file
rm -f $file.gz