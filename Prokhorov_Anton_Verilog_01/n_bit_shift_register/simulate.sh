#!/bin/bash

rm sim wave.vcd
iverilog -g2012 -o sim $(ls *.v) # Compile all .v-files in directory
vvp sim # Simulate
gtkwave wave.vcd # See waveforms