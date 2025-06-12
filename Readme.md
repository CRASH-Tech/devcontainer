### Build
```
docker build . -t crashntech/devcontainer:1.0.0-arm64 --platform linux/arm64 --build-arg ARCH=arm64
docker build . -t crashntech/devcontainer:1.0.0-amd64 --platform linux/amd64 --build-arg ARCH=amd64
```

### Alias
```
dev() {
    docker run \
        --hostname=devcontainer \
        --network=host \
        --mount type=bind,src=${HOME}/.ssh,dst=/home/crash/.ssh,ro \
        --mount type=bind,src=${HOME}/.kube,dst=/home/crash/.kube,ro \
        --mount type=bind,src=${HOME}/.talos,dst=/home/crash/.talos,ro \
        --mount type=bind,src=${HOME}/.terraform.d,dst=/home/crash/.terraform.d,ro \
        --mount type=bind,src=$(pwd),dst=/home/crash/project,ro \
        -it crashntech/devcontainer:1.0.0-${ARCH}
}
```