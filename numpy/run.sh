#bin/bash

case $1 in
    -o|--overwrite)
    OVERWRITE=TRUE
    shift # past argument
    shift # past value
    ;;
esac

if [ $OVERWRITE ] || [ ! $(docker images -q numpy) ]; then
  echo Build docker image
  echo
  docker build -t numpy .
else
  echo Numpy docker image already exist
  echo
fi

if [ ! -d $HOME/Documents/numpy ]; then
  echo Cloning numpy repo
  echo
  cd $HOME/Documents
  git clone https://github.com/zjpoh/numpy.git
  git remote add upstream https://github.com/numpy/numpy.git
else
  echo Numpy repo already exists
  echo
fi

if [ ! $(docker ps -a -q -f name=numpy) ]; then
  echo Run numpy Docker container
  echo
  docker run \
    -dit \
    --name numpy \
    -v $HOME/Documents/numpy:/root/numpy \
    numpy
else
  echo Numpy Docker container already exists
  echo
fi

if [ ! $(docker ps -q -f name=numpy) ]; then
  echo Start docker container
  echo
  docker start numpy
else
  echo Numpy docker container already running
  echo
fi

docker exec -it numpy bash
