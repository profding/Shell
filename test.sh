#! /bin/sh


#whoami: 拿到当前登陆用户的用户名
test "$(whoami)" != "root" && (echo you are using a non-privileged account; exit 1 )
