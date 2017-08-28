#!/usr/bin/env bash

#downlaod the zip file to the temporary space
bucketname="arun-cloudfront-logs" &&
prefix="lambda" &&
keyname="627434363107-aws-billing-detailed-line-items-with-resources-and-tags-2017-06.csv.zip" &&
zip_dd="/tmp" &&

#download the s3zip file
echo "downloading file"
aws s3 cp s3://$bucketname/$prefix/$keyname /tmp &&

#unzip the file to temporary directory
echo "extracting the file"
unzip -d $zip_dd /tmp/$keyname &&

#remove the zip file
echo "removing zip file"
rm -f $zip_dd/$keyname &&

#extracting file name for processing
echo "extracting filename after unzip the file"
filename=${keyname::-4}

#removing quotes
echo "producing the file without quotes"
cat $zip_dd/$filename | parallel --pipe --no-notice tr -d '\"' > /tmp/file_1.csv

#creating account specific data
echo "creating a multi-threaded script for extracting account specific data"
echo "#!/bin/bash" > extract_data.sh
while read p; do
    echo "cat $filename | parallel --no-notice --pipe grep $p > $p.csv &" >> ./extract_data.sh
done < ./accounts.txt

#to get the empty field data
condition='!length($3)'
echo "cat /tmp/file_1.csv | parallel --no-notice -k -q --block 100M --pipe awk -F , '$condition' > /tmp/627434363107.csv" >> /tmp/extract_data.sh

#control the prarallel process by prallel greps at one time
awk '1;!(NR%4){print "wait";}' /tmp/extract_data.sh > /tmp/data.sh
echo "wait" >>/tmp/data.sh
#!/usr/bin/env bash
set -e

sudo apt-get -y update &&
sudo apt-get install -y unzip parallel awscli git &&

export OWNER_ID=$(curl -s curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC_ADDRESS/owner-id) &&
export REGION=${region} &&

/usr/bin/aws --region $REGION s3 cp s3://$REGION-$OWNER_ID-secrets/github_deploy_key /root/.ssh/github_deploy_key &&
chmod 600 /root/.ssh/github_deploy_key &&

export GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=no -i /root/.ssh/github_deploy_key' &&
export HOME=/root/ &&
cd /tmp/ &&

echo "cloning the billing code" &&
git clone git@github.com:reancloud/radar-billing-distribitor.git &&

echo "triggiring the billing extraction process"
#bash /tmp/radar-billing-distribitor/billing.sh

echo "extracting account specific data"

#removing the original file
rm -f $zip_dd/$filename

#uploading into s3 bucket
#echo "uploading csv files into bucket"
#aws s3 cp /tmp/ s3://aruncloudfront-logs/billing_test/ --recursive exclude "*" include "*.csv"