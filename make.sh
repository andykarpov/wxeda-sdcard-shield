#!/bin/bash

boards=(wxeda-sd-mod)
exts=(pdf svg png ps)

for board in ${boards[*]}
do
    ./create_gerbers.sh ${board}.brd build/gerbers/${board}
    ./fix_drd.sh build/gerbers/${board}.drd
    for ext in ${exts[*]}
    do
	./create_images.sh build/gerbers/${board}.sol build/${ext}/${board} ${ext}
    done
done
