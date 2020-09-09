# setup
setup scripts

## Usage: (master)
```
curl -fsSL raw.github.com/wstein/setup/master/dev-base | sh -s
```
## Usage: (develop)

```sh
curl -fsSL raw.github.com/wstein/setup/develop/dev-base | sh -s
```


# check with docker:
## checkout
```sh
git clone --branch=develop git://github.com/wstein/setup $HOME/setup
```

## Fedora: 
```sh
docker run -dt -v $HOME/setup/dev-base:/tmp/dev-base:ro --name fedora fedora

docker exec fedora sh -x /tmp/dev-base
```

## Debian:
```sh
docker run -dt -v $HOME/setup/dev-base:/tmp/dev-base:ro --name debian debian

docker exec debian apt-get update 
docker exec debian apt-get install -y sudo
docker exec debian sh -x /tmp/dev-base

docker rm -f debian
```
