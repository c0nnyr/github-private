#!/bin/sh

encryption() {
  openssl rsautl -encrypt -in ../$1 -inkey ~/.rsakey_public -pubin -out $1;
}
decryption() {
  openssl rsautl -decrypt -in $1 -inkey ~/.rsakey_private -out ../$1;
}

private_dir=.private_repository
if [ ! -d $private_dir ]; then
  echo '.private_repository does not exist';
  exit 1;
fi

cd $private_dir;
if [[ $1 == add ]] && [[ -n $2 ]]; then

  encryption $2;
  git $*;

elif [[ $1 == 'checkout' ]]; then

  git $*;
  decryption $2;

elif [[ -n $1 ]]; then

  git $*;

fi
