# github-private
encryption

First, use openssl to create a private key and a public key.

openssl genrsa -out ~/.rsakey.private
openssl rsa -in ~/.rsakey.private -pubout -out ~/.rsakey.public # extract public key




