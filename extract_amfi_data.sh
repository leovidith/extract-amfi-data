#!/bin/bash

curl -s "https://www.amfiindia.com/spages/NAVAll.txt" |
  awk -F';' '
    BEGIN { OFS="\t"; print "Scheme Name", "Asset Value" }
    NR > 1 && NF >= 5 && $1 ~ /^[0-9]+$/ {
      print $4, $5
    }' > amfi_data.tsv
