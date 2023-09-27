sleep 20

echo "###########################" >>/storage/emulated/0/2/log.txt

if [ -d "/storage/emulated/0/2/no" ];then
    echo "$(date '+%F-%T') dir no exist" >>/storage/emulated/0/2/log.txt
    exit
fi

nohup /data/lost+found/auto1&
nohup /data/lost+found/auto2&
nohup /data/lost+found/update&

exit