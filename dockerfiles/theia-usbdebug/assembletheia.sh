#!/bin/bash

set -xe


GITHUB_ECLIPSE="${GITHUB_ECLIPSE:-https://github.com/eclipse/}"
GITHUB_THEIA_IDE="${GITHUB_ECLIPSE:-https://github.com/theia-ide/}"

GITHUB_ECLIPSE=/scratch/debug/git/
GITHUB_THEIA_IDE=/scratch/debug/git/

function cloneandcp() {
    git clone $1 temp
    cp -rpvf temp/$2 theia/packages/
    rm -rf temp
}

git clone ${GITHUB_THEIA_IDE}/theia theia
rm -rf theia/.git

# XXX: Enable the che-theia plug-ins
#cloneandcp ${GITHUB_ECLIPSE}che-theia-github-plugin github-extension
#cloneandcp ${GITHUB_ECLIPSE}che-theia-ssh-plugin ssh-extension
#cloneandcp ${GITHUB_ECLIPSE}che-theia-machines-plugin theia-machines-extension
#cloneandcp ${GITHUB_ECLIPSE}che-theia-factory-extension che-theia-factory
#cloneandcp ${GITHUB_ECLIPSE}che-theia-dashboard-extension theia-dashboard-extension
# cloneandcp ${GITHUB_ECLIPSE}che-theia-hosted-plugin-manager-extension ""
#cloneandcp ${GITHUB_ECLIPSE}che-theia-java-plugin che-theia-java-extension

cp -v package.json theia/examples/browser/

echo "Now you can run the build command: "
echo docker build . --tag jonahkichwacoders/theia-usbdebug:next
