#!/bin/sh

LOC='moscow ru'

RAW=$(ansiweather -l $LOC | awk '{print $5}')

echo "${RAW}°"