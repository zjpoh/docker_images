# Pyjanitor Container

Build image
```bash
docker build -t pyjanitor .
```

Run image
```bash
docker run \
  -dit \
  -p 8888:8888 \
  --name pyjanitor \
  -v $HOME/Documents/pyjanitor:/root/pyjanitor \
  pyjanitor
```

Connect to a container
```bash
docker exec -it pyjanitor bash
```

Run notebook in container
```bash
conda activate pyjanitor-dev
jupyter notebook \
  --ip 0.0.0.0 --port 8888 \
  --no-browser \
  --allow-root \
  --NotebookApp.token='' --NotebookApp.password=''
```
Notebook is available at localhost:8888
