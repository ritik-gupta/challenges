#!/bin/sh

# Shell script to query metadata of an instance inside azure.
# reference: "https://docs.microsoft.com/en-us/azure/virtual-machines/linux/instance-metadata-service"

# Checking if "jq" is installed if not, install it
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' jq |grep "install ok installed")
echo "Checking for jq: ${PKG_OK}"

if [ "" = "$PKG_OK" ]; then
  echo "No jq. Setting up jq."
  sudo apt-get --yes install jq
fi

# Query the API and parse it to json
queried_metadata_linux = $(curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq)

echo ${queried_metadata}