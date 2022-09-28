#!/bin/bash

mupip set -Extension_Count=10000 -REGION DEFAULT
mupip load v/transport/BMX.zwr
mupip load v/transport/BSDX.zwr
mupip set -Extension_Count=0 -REGION DEFAULT
