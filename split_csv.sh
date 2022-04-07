#!/bin/bash
FILENAME=$1
HDR=$(head -1 ${FILENAME})
split -l 200000 ${FILENAME} xyz
n=1
for f in xyz*
do
        if [[ ${n} -ne 1 ]]; then
                   echo ${HDR} > part-${n}-${FILENAME}.csv
                      fi
                         cat ${f} >> part-${n}-${FILENAME}.csv
                            rm ${f}
                               ((n++))
        done
