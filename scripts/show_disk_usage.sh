# [sudo] bash show_disk_usage.sh directory depth
param_cnt=$#
echo $param_cnt params
dir=./
depth=1

if [ $param_cnt = 0 ]; then
    echo "use current directory as the target"
else
    dir=$1
    if [ ! -e "${dir}" ]; then
        echo "Error! The directory ${dir} doesn't exit!"
        exit 1
    fi
    if [ $param_cnt = 2 ]; then
        depth=$2
    fi
    echo "ready to calculate the storage info of ${dir} with search depth ${depth}"
fi


# save the result into ~/disk_rec/ (~/ could be your home directory or /root when using sudo)
if [ ! -e ~/disk_rec ]; then
    mkdir ~/disk_rec
fi
write_file=~/disk_rec/disk_usage_$(date +%Y%m%d)_.log
echo "The storage info of ${dir} with search depth ${depth} on $(date +%Y/%m/%d):" >> ${write_file}
result="$(du -h --max-depth=${depth} $dir | sort -rh)"
echo "${result}" >> ${write_file}
echo "*****************************************************************" >> ${write_file}

# chown guangxing ${write_file}
echo "the result file is ${write_file}"
echo "*****************************************************************"
echo "$result"
