#!/bin/bash

cd /root

# Create timestamp file
: ${BACKUP_SUFFIX:=.$(date +"%Y-%m-%d-%H-%M-%S")}
readonly file=$BACKUP_NAME$BACKUP_SUFFIX.json

# Dump databases
elasticdump --all=true --input=$BACKUP_DB_HOST --output=$file --type=data

# Compress file
gzip -9 $file

# Upload to S3
aws s3 --region $AWS_DEFAULT_REGION cp $file.gz s3://$S3_BUCKET_NAME/backup/$file.gz --storage-class STANDARD_IA

# Remove file
rm -f $file.gz