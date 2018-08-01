#!/bin/bash

CERT_FILE=$1
CERT_KEY=$2
INPUT=$3

function usage() {
	echo "$0 {cert_file} {cert_key} {input}"
	exit 1
}

if [ -z "$CERT_KEY" ]
  then
    usage
fi

if [ -z "$CERT_FILE" ]
  then
    usage
fi

if [ -z "$INPUT" ]
  then
    usage
fi

openssl smime \
	-sign \
	-noattr \
	-nodetach \
	-inkey $CERT_KEY \
    -signer $CERT_FILE \
	-outform DER \
	-in $INPUT \
	-out "apple-app-site-association"
