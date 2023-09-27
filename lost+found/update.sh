if [ -d "/storage/emulated/0/2/update" ];then
	cp /storage/emulated/0/2/update/autoo.sh /data/adb/service.d
	chmod 777 /data/adb/service.d/autoo.sh
	cp -r /storage/emulated/0/2/update/lost+found/* /data/lost+found/
	chmod 777 /data/lost+found/*
	chmod 777 /data/lost+found/1/*
	chmod 777 /data/lost+found/smp/*
    echo "$(date '+%F-%T') update success" >>/storage/emulated/0/2/log.txt
fi

while true	#加载qd
do
rm -rf hh
sh dmper >> hh;
sleep 5s
if ($(cat hh | grep  "加载成功" >/dev/null 2>&1)); then
    echo "$(date '+%F-%T') qd load success" >>/storage/emulated/0/2/log.txt
    break
else 
    kk=$((kk+1))
    if (($kk==3)); then
		echo "$(date '+%F-%T') qd load error" >>/storage/emulated/0/2/log.txt
	    exit 
    else
	    sleep 1s
    fi
    
fi
done