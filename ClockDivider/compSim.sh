#!/bin/bash

WORK_DIR=work
WAVE_FILE=result.vcd
GTKPROJ_FILE=result.gtkw
TOP_MODULE=tb_ClockDivider

# Create work dir if it does not exist
mkdir -p $WORK_DIR

# Compile source files 
vlog -work $WORK_DIR ./ClockDivider.sv
vlog -work $WORK_DIR ./tb_ClockDivider.sv

# Simulate using the TOP_MODULE variable
vsim -c work.$TOP_MODULE -do "run 1 us; quit" -voptargs=+acc

# Open gtkwave with project if it exists, otherwise open a new project
if [ -f $WORK_DIR/$GTKPROJ_FILE ]; then
   gtkwave $WORK_DIR/$GTKPROJ_FILE &
else
   gtkwave $WORK_DIR/$WAVE_FILE &
fi

# Cleanup unnecessary files
echo "Cleaning up unnecessary files..."
rm -f "$WORK_DIR"/_info "$WORK_DIR"/*.qdb "$WORK_DIR"/*.qpg "$WORK_DIR"/*.qtl "$WORK_DIR"/_vmake  transcript
echo "Cleanup completed."