#!/bin/bash

extract_column=${PWD}/extract_column.txt

echo -e "\nExtract Column starting..."

cat $extract_column

echo -e "\nListing just the first column"

for i in $(cat $extract_column | awk '{print $1}')
do
  echo $i
done

echo -e "\nFind what javascript framework is used..."

grep 'javascript' $extract_column | awk '{print $2}' 

echo -e "\nDone!"
