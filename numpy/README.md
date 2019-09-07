# Pyjanitor Container

Build image
```bash
docker build -t numpy .
```

Run image
```bash
if [ ! -d "$DIRECTORY" ]; then
  cd $HOME/Documents
  git clone https://github.com/zjpoh/numpy.git
  git remote add upstream https://github.com/numpy/numpy.git
fi

docker run \
  -dit \
  --name numpy \
  -v $HOME/Documents/numpy:/root/numpy \
  numpy
```

Connect to the container
```bash
docker exec -it numpy bash
```
