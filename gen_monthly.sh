#!/bin/bash

CONFIGCASE=INALT20.L46-KFS119 # HOST! (e.g. VIKING20X.L46-KFS003-6th)
INDIR=/gxfs_work2/geomar/smomw355/model_data/ocean-only/INALT20.L46-KFS119/output

$1 # input year

let "LEAP= $1 % 4 "  # if 0 then leap year


if [ $LEAP -eq 0 ]
then
echo $1 is a leap year with 366 days
#366

date
for ii in grid_U grid_V 
do
(ncra -F -d time_counter,1,31 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc  1_${CONFIGCASE}_1m_${1}_01_${ii}.nc;
ncra -F -d time_counter,32,60 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_02_${ii}.nc;
ncra -F -d time_counter,61,91 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_03_${ii}.nc;
ncra -F -d time_counter,92,121 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_04_${ii}.nc;
ncra -F -d time_counter,122,152 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_05_${ii}.nc;
ncra -F -d time_counter,153,182 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_06_${ii}.nc;
ncra -F -d time_counter,183,213 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_07_${ii}.nc;
ncra -F -d time_counter,214,244 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_08_${ii}.nc;
ncra -F -d time_counter,245,274 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_09_${ii}.nc;
ncra -F -d time_counter,275,305 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_10_${ii}.nc;
ncra -F -d time_counter,306,335 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_11_${ii}.nc;
ncra -F -d time_counter,336,366 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_12_${ii}.nc;
ncrcat 1_${CONFIGCASE}_1m_${1}_??_${ii}.nc 1_${CONFIGCASE}_1m_${1}0101_${1}1231_${ii}.nc;
rm 1_${CONFIGCASE}_1m_${1}_??_${ii}.nc;
date; echo $ii ${1} done) &
done

else

echo ${1} is a year with 365 days
#365

date
for ii in grid_U grid_V 
do
(ncra -F -d time_counter,1,31 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc  1_${CONFIGCASE}_1m_${1}_01_${ii}.nc;
ncra -F -d time_counter,32,59 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_02_${ii}.nc;
ncra -F -d time_counter,60,90 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_03_${ii}.nc;
ncra -F -d time_counter,91,120 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_04_${ii}.nc;
ncra -F -d time_counter,121,151 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_05_${ii}.nc;
ncra -F -d time_counter,152,181 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_06_${ii}.nc;
ncra -F -d time_counter,182,212 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_07_${ii}.nc;
ncra -F -d time_counter,213,243 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_08_${ii}.nc;
ncra -F -d time_counter,244,273 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_09_${ii}.nc;
ncra -F -d time_counter,274,304 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_10_${ii}.nc;
ncra -F -d time_counter,305,334 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_11_${ii}.nc;
ncra -F -d time_counter,335,365 ${INDIR}/1_${CONFIGCASE}_1d_${1}0101_${1}1231_${ii}.nc 1_${CONFIGCASE}_1m_${1}_12_${ii}.nc;
ncrcat 1_${CONFIGCASE}_1m_${1}_??_${ii}.nc 1_${CONFIGCASE}_1m_${1}0101_${1}1231_${ii}.nc;
rm 1_${CONFIGCASE}_1m_${1}_??_${ii}.nc;
date; echo $ii ${1} done) &
done


fi

wait
date

