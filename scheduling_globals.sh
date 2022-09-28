#!/bin/bash

rm v/transport/BMX.zwr
rm v/transport/BSDX.zwr

mupip extract -format=zwr -select=BMX* v/transport/BMX.zwr
mupip extract -format=zwr -select=BSDX* v/transport/BSDX.zwr
