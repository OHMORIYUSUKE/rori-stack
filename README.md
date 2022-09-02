# rori-stack

レンタルサーバーもどき

```sh
$ ssh u-tan@ssh.example.local -i ~/.ssh/github
```

```sh
$ apt update
$ apt install apache2
$ systemctl status apache2
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
  Drop-In: /lib/systemd/system/apache2.service.d
           └─apache2-systemd.conf
   Active: inactive (dead)
$ systemctl start apache2
$ apt install nginx
$ systemctl start nginx
```

vim 文字化け

```sh
$ export LANG=C.UTF-8
```

docker install

https://qiita.com/wakki_haya/items/a00ecdc231e131b4d18d

```sh
nginx-proxy/$ docker compose up -d
ec3/$ docker build ./ -t rori_stack/ec3
$ docker run --detach -t -i --privileged --name rori_stack_ec3_u-tan --network=rori-stack --env VIRTUAL_HOST=u-tan.ec3.example.local --env LANG=C.UTF-8 rori_stack/ec3

$ docker container rm -f rori_stack_ec3_u-tan
```

手順

```sh
# sshサーバー起動初回のみ
$ docker cp ./share-volume/ssh-server ssh-server-ssh-1:/ssh-server
$ docker exec ssh-server-ssh-1 sh //ssh-server/init.sh u-tan
# ユーザー追加時
$ docker cp ./share-volume/ssh-server ssh-server-ssh-1:/ssh-server
$ docker exec ssh-server-ssh-1 sh //ssh-server/ssh-key-register.sh u-tan u-tan-password
$ docker exec ssh-server-ssh-1 sh //ssh-server/set-first-cmd.sh u-tan
```
