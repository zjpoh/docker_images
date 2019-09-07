#bin/bash

case $1 in
    -o|--overwrite)
    OVERWRITE=TRUE
    shift # past argument
    shift # past value
    ;;
esac

NAME=numpy

if [ ! -d $HOME/Documents/numpy ]; then
  echo Cloning numpy repo to local machine
  echo
  pushd $HOME/Documents
  git clone https://github.com/zjpoh/numpy.git
  cd numpy
  git remote add upstream https://github.com/numpy/numpy.git
  popd
fi

if [ $OVERWRITE ]; then
  echo Overwrite enable
  if [ $(docker ps -q -f name=$NAME) ]; then
    echo Stop container
    docker stop $NAME > /dev/null
  fi
  if [ $(docker ps -a -q -f name=$NAME) ]; then
    echo Remove container
    docker rm $NAME > /dev/null
  fi
  if [ $(docker images -q $NAME) ]; then
    echo Remove image
    docker rmi $NAME > /dev/null
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
    -v $HOME/Documents/$NAME:/root/$NAME \
    $NAME
fi

if [ ! $(docker ps -q -f name=$NAME) ]; then
  echo Start docker container
  echo
  docker start $NAME
fi

docker exec -it $NAME bash
