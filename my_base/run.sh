#bin/bash

case $1 in
    -o|--overwrite)
    OVERWRITE=TRUE
    shift # past argument
    shift # past value
    ;;
esac

NAME=my_base

if [ $OVERWRITE ]; then
  echo Overwrite enable
  if [ $(docker ps -q -f name=$NAME) ]; then
    echo Stop container
    docker stop $NAME
  fi
  if [ $(docker ps -a -q -f name=$NAME) ]; then
    echo Remove container
    docker rm $NAME
  fi
  if [ $(docker images -q $NAME) ]; then
    echo Remove image
    docker rmi $NAME
  fi
fi

if [ ! $(docker images -q $NAME) ]; then
  echo Build docker image
  echo
  docker build -t $NAME .
fi

if [ ! $(docker ps -a -q -f name=$NAME) ]; then
  echo Run docker container
  echo
  docker run \
    -dit \
    --name $NAME \
    $NAME
fi

if [ ! $(docker ps -q -f name=$NAME) ]; then
  echo Start docker container
  echo
  docker start $NAME
fi

docker exec -it $NAME bash
