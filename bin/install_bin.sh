#!/bin/bash

TODIR=~/bin

mkdir -p $TODIR

THISDIR=$(realpath $(dirname $0))

ln -sf $THISDIR/duplication_sweeper.sh $TODIR/.
ln -sf $THISDIR/gripen.sh $TODIR/.
ln -sf $THISDIR/git-all-status.sh $TODIR/.
ln -sf $THISDIR/install_chrome_driver.sh $TODIR/.
ln -sf $THISDIR/logger.sh $TODIR/.
ln -sf $THISDIR/ksar-pdf.sh $TODIR/.

