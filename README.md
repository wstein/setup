# setup
setup minimal zsh base environments

## Build docker container: (develop)

debian 10:
```sh
docker build -f docker/Dockerfile --build-arg=BASE_IMAGE=debian:9 -t mydebian .  
```
