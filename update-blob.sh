#!/bin/bash
account='<storage account name>'
container='<container name>'
key='<storage account key>'
az storage blob list --query "[].name" --container-name $container --account-name $account --account-key $key -o tsv >> blobs.txt
for i in `cat blobs.txt`
do
az storage blob update --container-name $container --account-name $account --account-key $key --name $i --content-type '<MIME Type>'
done
