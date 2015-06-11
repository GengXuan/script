#!/usr/bin/sh

# 自动ssh连接到远程服务器，并修改终端标题
# ssh_connect.sh  9
# 连接到 192.168.1.9，使用PASSWD所记录的密码

PART_IP=$1
IP=192.168.1.${PART_IP}

case ${PART_IP} in
9)
	PASSWD="xxx"
	;;
10)
	PASSWD="xxx"
	;;
11)
esac

#      	PROMPT_COMMAND='echo -ne "\033]0;"192.168.1.10"\007"'
SEND_CMD="PROMPT_COMMAND='echo\x20-ne\x20\"\x5C\x30\x33\x33]0\;\"${IP}\"\x5C\x30\x30\x37\"'"
 
auto_login_ssh () { 
expect -c "
set timeout -1; 
spawn -noecho ssh $2
expect *assword:*; 
send -- $1\r; 
expect  *login*;
puts aaa$3
send -- $3\r;
send -- clear\r;
interact;"; 
}   

auto_login_ssh ${PASSWD}  root@${IP} $SEND_CMD
