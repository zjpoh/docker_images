#bin/bash

case $1 in
    -o|--overwrite)
    OVERWRITE=TRUE
    shift # past argument
    shift # past value
    ;;
esac

NAME=pyjanitor

if [ ! -d $HOME/Documents/pyjanitor ]; then
  echo Cloning pyjanitor repo to local machine
  echo
  cd $HOME/Documents
  git clone https://github.com/zjpoh/pyjanitor.git
  git remote add upstream https://github.com/ericmjl/pyjanitor.git
fi

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
    -p 8888:8888 \
    --name $NAME \
    -v $HOME/Documents/$NAME:/root/$NAME \
    $NAME
fi

if [ ! $(docker ps -q -f name=$NAME) ]; then
  echo Start docker container
  echo
  docker start $NAME
fi

docker exec -it $NAME bash
