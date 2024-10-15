#!/bin/bash
# download Property_Tax_Roll.csv
# wget http://pages.stat.wisc.edu/~jgillett/DSCP/linux/Property_Tax_Roll.csv

# pipeline
cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOLS" | \
cut -d ',' -f 7 | \
{ sum=0; count=0; while read n; do sum=$(($sum + $n)); count=$((count + 1)); done; avg=$(echo "$sum / $count" | bc -l); echo $avg; } 
    
# or at the last step, use awk to extract & summarize data
# awk 'BEGIN {sum=0; count=0} {sum += $1; count++} END {if (count > 0) print sum/count; else print "No data found."}'
