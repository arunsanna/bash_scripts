#!/usr/bin/env bash
# command line arguments
usage() { echo "Usage: $0 [-p <Path specified must be a Directory>]"; exit 1; }
while getopts ":p:" args; do
     case ${args} in
        p)
            path=${OPTARG}
            ;;
        *)
            usage
            ;;
     esac
done
create_folders()
{
echo ${path}
mkdir ${path}
cd ${path}

#calling function roll
#roll=()

#calling function last
#last=()

#for (( level=1; level<4; level++ ))
#do
#   for p in ${path}
#   do
#     last=()
#        last=${p}
#        echo "assigning last to p"
#        for q in "${last[@]}"
#            do
#            echo "----in last----"
#            cd ${q}
#            echo "printing qqqqqq----------------"
#            echo ${q}
#            list=$PWD
#            for (( count=1; count<4; count++ ))
#            do
#                mkdir L${level}F${count}
#            done
#            dd if=/dev/zero of=file.txt bs=1024 count=2048
#            roll+=$(ls -d ${list}/*/)
#            #spare+=${roll[@]}
#            echo "printing rollll-------"
#            echo ${roll[@]}
#        done
#   done
#   path=()
#   path=${roll[@]}
#   roll=()
#  #spare=()
#done
}

# calling function
create_folders ${path}