# rori-stack

レンタルサーバーもどき

```sh
$ ssh u-tan@ssh.example.local -i ~/.ssh/u-tan
```
```json
{
  "user_password": "u-tan-password",
  "user_name": "u-tan",
  "app_name": "u-tan-app",
  "ssh_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLO+vEs9KkiiIuSql+HGg20+TIhtOMobn0SiAP7qP+oE/R2pNUfmCuaMtuBs/yrF+EXyWs+kJm06Wz+cWx2ibu6uL2YYgRsWGjoGNfeCPBYblWtBV5JijqcnncQrbFpw7ovCqjS7kS4zu0Syf3f3AQzZdIs2CO0eRyoYyYZdK9HOrDa7jFf6GpmQTocMwxUyodw/tkSk4hZO1k3Fo+0atqk4o5KncwQ94FR+aFDbGBOFuE3MQRAcAYzQkgWbs0ur0NudjIKi4WY1shr4PF+2Dg1APD0r1z52TdtI178qL+Dod4neiazvtEr/Sc8X/nv5L7jq35GzuqNxgYb0c2BoPkXScfRsWxlrbdWd9WcXh0DfHfVvLKlxYBNvK79MyaAX8eqLTVVTW1HAsAwXanuklZ/6aqCBwZKtC1cTstACCHtvdqjdzvsR+sWyR3Bb6fdWN9v/K/aNoIoTTSGSQ3Yzwssg2j3UZFk1BCDavybHS9qSkIbOcbMgDTTmLIFyQjyU8= 81908@LAPTOP-SALKU03L"
}
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

mysql

```sh
$ sudo touch /var/run/mysqld/mysqld.sock
$ sudo mysql -u root
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
