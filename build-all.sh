#!/bin/bash

source config.sh

runmode=$RUNMODE
nr_jobs=$NR_JOBS

cd minigui
./autogen.sh; ./configure --enable-develmode --with-runmode=$runmode
make -j$nr_jobs; sudo make install
cd ..

for comp in minigui-res mg-tests mgutils mgplus mgeff mgncs mgncs4touch mg-tools mg-samples mg-demos cell-phone-ux-demo; do
    cd $comp
    ./autogen.sh; ./configure --enable-develmode
    make -j$nr_jobs; sudo make install
    cd ..
done
