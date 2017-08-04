mysqldump -u{你的用户名} -p{你的密码} --single-transaction --flush-logs --master-data=2 --all-databases | gzip > {你的悲愤路径}`date "+%s"`.sql.gz

# 删除十天前的日志

for file in `ls {你的悲愤路径}*.gz`
do
        filename=${file##*/}
        filename=${filename%.*}
        filename=${filename%.*}
        olddate=`expr 240 \* 3600`
        nowdate=`date '+%s'`
        olddate=`expr $nowdate - $olddate`
        if test $filename -lt $olddate
        then
                rm $file
        fi
done


echo "success"

