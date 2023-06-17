#!/bin/sh
architectures="all amd64 i386"

unstable=fijik19

dir="$(realpath $(dirname $0))/var/lib/apt/local/"

mkdir "${dir}/pool/" -p
cd "${dir}"

for i in $architectures
do
    mkdir -p "dists/${unstable}/main/binary-${i}"

    apt-ftparchive packages -a "${i}" pool > "dists/${unstable}/main/binary-${i}/Packages"
    cat "dists/${unstable}/main/binary-${i}/Packages" | gzip -c9 > "dists/${unstable}/main/binary-${i}/Packages.gz"
    cat "dists/${unstable}/main/binary-${i}/Packages" | bzip2 -c9 > "dists/${unstable}/main/binary-${i}/Packages.bz2" 

    apt-ftparchive contents -a "${i}" pool > "dists/${unstable}/main/Contents-${i}"
    cat "dists/${unstable}/main/Contents-${i}" | gzip -c9 > "dists/${unstable}/main/Contents-${i}.gz"
    cat "dists/${unstable}/main/Contents-${i}" | bzip2 -c9 > "dists/${unstable}/main/Contents-${i}.bz2"
done

echo "Suite: ${unstable}" > "dists/${unstable}/Release"
echo "Components: main" >> "dists/${unstable}/Release"
echo "Origin: ${unstable}" >> "dists/${unstable}/Release"
echo "Label: ${unstable}" >> "dists/${unstable}/Release"
echo "Codename: ${unstable}" >> "dists/${unstable}/Release"
echo "Date: $(date -R -u)" >> "dists/${unstable}/Release"
echo "Architectures: ${architectures}" >> "dists/${unstable}/Release"
echo "Description: Debian qutIM unstable" >> "dists/${unstable}/Release"
apt-ftparchive release "dists/${unstable}" >> "dists/${unstable}/Release"

update-repo(){
 for source in "$@";
 do
 sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/${source}.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0";
 done
}

update-repo fijik19
