#/bin/bash

dir="$(realpath $(dirname $0))/var/lib/apt/local/pool/perl/"
mkdir "${dir}" -p

(
cd "${dir}.cpan/build"
for i in "${@}"
do
    DEB_BUILD_OPTIONS=nocheck HOME="${dir}" cpan2deb --recursive "${i}"
done
)
