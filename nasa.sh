#/bin/bash

DAY=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18"  "19"  "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31")

echo "===================HOSTSUNICOS=================="

echo "Quantidade de Hosts únicos "$(cat access_log_Aug95 | awk '{print $1}' | sort | uniq | wc -l)

echo "=================ERROS 404=================="
for i in "${DAY[@]}"
do
 	echo -n "Ag/$i -"; echo "- "$(cat access_log_Aug95 | grep " 404 " | grep "\[$i" | wc -l)
done

echo "===============BYTES===================="

echo "Quantidade de bytes "$(cat access_log_Aug95 | awk '{s+=$NF} END {print s/ 1024 /1024}')"MB"  

echo ""
echo "==================TOP 5================"
cat access_log_Aug95 | grep " 404 " | awk '{print $1}' | sort | uniq -c | sort -rn | head -5



