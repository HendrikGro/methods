#!/bin/bash

for year in {1982..2022};do
wget "ftp://ftp2.psl.noaa.gov/Datasets/noaa.oisst.v2.highres/sst.day.mean.$year.nc"
done

