#!/bin/bash

# user vars
OBJ_DIR=build
if [[ $# -eq 0 ]] then DUT_NAME=RISC;
else DUT_NAME=$1; fi

# script vars
ID=`tput sgr0``tput bold``tput setab 7``tput setaf 0`
COMD=`tput sgr0``tput bold`
SUCC=`tput sgr0``tput bold``tput setaf 2`
FAIL=`tput sgr0``tput bold``tput setaf 1`
RSET=`tput sgr0`


# cleanup
echo "${ID}[build.sh]${COMD} Cleaning previous files...${RSET}"

rm -rf $OBJ_DIR
rm -f $DUT_NAME.vcd

if [ $? -eq 0 ]; then echo "${ID}[build.sh]${SUCC} Cleanup complete.${RSET}";
else echo "${ID}[build.sh]${FAIL} Cleanup failed.${RSET}"; fi


# verilate system verilog files
echo "${ID}[build.sh]${COMD} Verilating $DUT_NAME.sv using doit.config...${RSET}"

verilator -F doit.config --cc --trace $DUT_NAME.sv --exe ${DUT_NAME}_tb.cpp

if [ $? -eq 0 ]; then echo "${ID}[build.sh]${SUCC} Verilation complete.${RSET}";
else echo "${ID}[build.sh]${FAIL} Verilation failed. Check error messages.${RSET}"; fi


# build verilator translation
echo "${ID}[build.sh]${COMD} Making V$DUT_NAME using V$DUT_NAME.mk...${RSET}"

make -s -j -C $OBJ_DIR/ -f V$DUT_NAME.mk V$DUT_NAME

if [ $? -eq 0 ]; then echo "${ID}[build.sh]${SUCC} Make complete.${RSET}";
else echo "${ID}[build.sh]${FAIL} Make failed. Check error messages.${RSET}"; fi


# run
echo "${ID}[build.sh]${COMD} Executing $OBJ_DIR/V$DUT_NAME...${RSET}"

$OBJ_DIR/V$DUT_NAME

if [ $? -eq 0 ]; then echo "${ID}[build.sh]${SUCC} Execution succeeded.${RSET}";
else echo "${ID}[build.sh]${FAIL} Execution failed.${RSET}"; fi