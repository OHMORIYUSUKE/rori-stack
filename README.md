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

手順

```sh
# sshサーバー起動初回のみ
$ sh make.sh
```
