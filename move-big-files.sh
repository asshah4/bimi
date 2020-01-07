#!/bin/bash

# Could use this as a shell script, or just guide for moving files

# Heavy ECG data from Amit research drive (must be in correct research drive
rsync -arvuzm --include '*/' --include '*ECG*' --exclude '*' ./ asshah4@phc5.sph.emory.edu:projects/bimi/data/

