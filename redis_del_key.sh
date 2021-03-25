#!/bin/bash
redis_list=("masterip1:16379" "masterip2:16380"   "masterip3:16379")



for info in ${redis_list[@]}
    do
        echo "开始执行:$info"
        ip=`echo $info | cut -d \: -f 1`
        port=`echo $info | cut -d \: -f 2`
        ./src/redis-cli -c -h $ip -p $port -a "xxxx" keys $1  | xargs -r -t -n1 ./src/redis-cli -c -h $ip -p $port -a "xxxx" del
        ./src/redis-cli -c -h $ip -p $port -a "xxxx" keys $1
    done
echo "完成"
