#!/bin/bash

# Find all the ecg files
# Get rid of the useless spaces
find ./data/* -type f -name "*ECG.txt" -print0 | \
	xargs -0 sed -i -e "s/ -9999//g"
