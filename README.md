# rori-stack

レンタルサーバーもどき

```sh
$ ssh root@u-tan.ec3.example.local -i ~/.ssh/github
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

ssh メモ
コンテナ内でユーザーごとに実行する

```sh
$ useradd -p $(perl -e 'print crypt("password", "\$6\$salt03")') u-tan
$ mkdir -p /home/u-tan/.ssh
$ cp /ssh-server/user-keys/u-tan/id_rsa.pub /home/u-tan/.ssh/id_rsa.pub
$ cat /home/u-tan/.ssh/id_rsa.pub >> /home/u-tan/.ssh/authorized_keys
```
