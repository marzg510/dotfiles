#!/bin/bash

YMD=$(date --date yesterday +%Y%m%d)
DAY=$(date --date yesterday +%d)

cd ~/bin/kSar
java -jar kSar.jar -input "cmd://sar -f /var/log/sysstat/sa${DAY} -A" -outputPDF ~/PDF/perf${YMD}.pdf

