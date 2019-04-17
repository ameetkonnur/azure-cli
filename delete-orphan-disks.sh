#!/bin/bash
rm disks.txt
az disk list --query '[?(managedBy=="")].{ID:id}' -o tsv >> disks.txt
for i in `cat disks.txt`
do
az disk delete --ids $i -y
done