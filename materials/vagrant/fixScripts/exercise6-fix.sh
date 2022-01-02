#!/bin/bash
#add fix to exercise6-fix here
if [ "$#" -lt 2 ];then
	echo "Error: less than 2 parameters"
	exit 1
fi

number_of_parameters=$#
dest_dir=${!number_of_parameters}
current_server=$HOSTNAME
bytes_copied=0

if [[ ${HOSTNAME} == "server1" ]]
then
        dest_server="server2"
else
        dest_server="server1"
fi

for((i=1; i<$#; i++))
do
        current_file_to_copy=${!i}
        scp $current_file_to_copy $USER@$dest_server:$dest_dir
        (( bytes_copied=bytes_copied+$(stat -c%s $current_file_to_copy) ))
#        echo "bytes copyed= $(stat -c%s $current_file_to_copy)"
done

echo $bytes_copied
