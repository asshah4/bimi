#!/bin/bash

# File name
FILE='test.txt'

# Extract time stamp
declare TIME=$(sed '2q;d' $FILE)
sed '2q;d' $FILE > tmp.txt

# Skip first headings
tail -n +4 $FILE | awk '{print $1,$2}' >> tmp.txt

# Multiple visits are subfolders
for f in ./*/*/*ECG.txt; do
	cd "$f"
done


# To clean up all the parameter files that are old
for d in ./proc_data/*/; do (cd "$d" && ls -t Param*.csv | sed '1d' | xargs rm); done
for d in ./proc_data/*/; do (cd "$d" && ls -t Param*.tex | sed '1d' | xargs rm); done

# Removed WIndows file
for d in ./proc_data/*/; do (cd "$d" && ls -t Removed*.csv | sed '1d' | xargs rm); done

# HRV result files
for d in ./proc_data/*/; do (cd "$d" && ls -t *HRV_results*.csv | sed '1d' | xargs rm); done





