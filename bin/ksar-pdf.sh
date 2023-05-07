#!/bin/bash

YMD=$(date --date yesterday +%Y%m%d)
DAY=$(date --date yesterday +%d)
pushd $(cd $(dirname $0);pwd)
java -jar ksar.jar -input "cmd://sar -f /var/log/sysstat/sa${DAY} -A" -outputPDF ~/PDF/perf${YMD}.pdf
popd

