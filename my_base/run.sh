#bin/bash

case $1 in
    -o|--overwrite)
    OVERWRITE=TRUE
    shift # past argument
    shift # past value
    ;;
esac

if [ $OVERWRITE ] || [ ! $(docker images -q my_base) ]; then
  echo Build docker image
  echo
  docker build -t my_base .
else
  echo My base docker image already exist
  echo
fi

if [ ! $(docker ps -a -q -f name=my_base) ]; then
  echo Run my base docker container
  echo
  docker run \
    -dit \
    --name my_base \
    my_base
else
  echo My base docker container already exists
  echo
fi

if [ ! $(docker ps -q -f name=my_base) ]; then
  echo Start docker container
  echo
  docker start my_base
else
  echo My base docker container already running
  echo
fi

docker exec -it my_base bash
