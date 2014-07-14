#!/bin/bash


NOW=`(date +%d-%b-%y)`
echo $NOW

dumpFileName='dump-'${NOW}'.dump'
dump1FileName='log1-'${NOW}'.log' 
log1FileName='log2-'${NOW}'.log'
log2FileName='log3-'${NOW}'.log'
log4FileName='log4-'${NOW}'.log'

sudo tcpdump -i lo -n -c 10000 -w $dumpFileName
sudo tcpdump -nlq -r $dumpFileName > $dump1FileName
sudo tcpstat -r $dumpFileName -o "%r %a %m %M %d %l %N %n %p \n" > $log1FileName
sudo tcpstat -r $dumpFileName -o "%a %m %M \n" > $log4FileName
sudo tcptrace -l -u -r -n $dumpFileName > $log2FileName
