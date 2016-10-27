#!/usr/bin/env bash
#set -u -x -v -e
mkdir -p "${HOME}/.gradle"
if [[ -d $ROCKET_CACHE/.gradle ]];then
    cp -r $ROCKET_CACHE/.gradle $HOME
fi    
test -f $(which aws)
test -f $(which gcloud)
set +e
./gradlew assemble test --stacktrace
code=$?
set -e
cp -r ${HOME}/.gradle $ROCKET_CACHE
exit $code 
# rsync -avz --exclude=tmp/ --exclude=intermediates/ --exclude='**/*.java' --exclude='**/*.class' ./app/build $ROCKET_ARTIFACTS && exit $code
