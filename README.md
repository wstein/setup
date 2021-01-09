# setup
setup my prevered zsh based environment
## on existing alpine/archlinux/centos/debian/fedora/ubuntu machines

```sh
cd ~
wget https://github.com/wstein/bin/raw/master/install-minimal
sh install-minimal

git clone https://github.com/wstein/bin
git clone https://github.com/wstein/.config

sh ~/bin/setup-user
```
## Build docker container: (develop)

debian 10:
```sh
docker build -f docker/Dockerfile --build-arg=BASE_IMAGE=debian:10 -t myDebianImage .

docker run -it --rm -e TERM -v /etc/localtime:/etc/localtime:ro myDebianImage
```
