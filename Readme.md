### Build
```
docker build . -t crashntech/devcontainer:1.1.0-arm64 --platform linux/arm64 --build-arg ARCH=arm64
docker build . -t crashntech/devcontainer:1.1.0-amd64 --platform linux/amd64 --build-arg ARCH=amd64
```

### Alias
```
dev() {
    docker run \
        --hostname=devcontainer \
        --network=host \
        --mount type=bind,src=${HOME},dst=/home/crash \
        --mount type=bind,src=$(pwd),dst=/home/crash/project \
        -it crashntech/devcontainer:1.1.0-${ARCH} \
        /bin/bash -rcfile .my_bashrc
}

dev86() {
    docker run \
        --hostname=devcontainer \
        --network=host \
        --mount type=bind,src=${HOME},dst=/home/crash \
        --mount type=bind,src=$(pwd),dst=/home/crash/project \
        --platform linux/amd64 \
        -it crashntech/devcontainer:1.1.0-amd64 \
        /bin/bash -rcfile .my_bashrc
}
```
