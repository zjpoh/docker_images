# Pyjanitor Container

Build image
```bash
docker build -t leetcode .
```

Run image
```bash
docker run \
  -dit \
  --name leetcode \
  -v $HOME/Documents/leetcode:/root/leetcode \
  leetcode
```

Connect to a container
```bash
docker exec -it leetcode bash
```
