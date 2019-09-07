# Cheatsheet

Build a image
```bash
docker build -t <image_name> .
```

Run a docker image and link a mount a local file to container
```bash
docker run -dit --name <container_name> -v <local_path>:<container_path> <image_name>
```

"Login" to a container
```bash
docker exec -it <container_name> bash
```

Start/stop a container
```bash
docker start/stop <container_name>
```

# Image descriptions

- [`my_base`](my_base): My base image containing myrc.
