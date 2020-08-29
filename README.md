# setup
setup scripts

## Usage:
```sh
curl -sL raw.github.com/wstein/setup/master/dev-base | sh 
```

# check with docker:
## checkout
~~~
git clone git://github.com/wstein/setup
cd setup 
git checkout current
~~~

## Fedora: 
```sh
docker run -it --rm -v $HOME/setup/dev-base:/tmp/dev-base:ro --entrypoint=/usr/bin/sh fedora "/tmp/dev-base && zsh"                                     
```

## Debian:
```sh
docker run -it --rm -v $HOME/setup/dev-base:/tmp/dev-base:ro --entrypoint=sh debian -c "apt update && apt install -y sudo && /tmp/dev-base && zsh"
```
