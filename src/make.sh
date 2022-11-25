rm -rf obj_dir
rm -f VControlUnit.vcd

verilator --Wall --cc --trace RISC.sv control_unit.sv instr_mem.sv pc_top.sv reg_file.sv alu.sv sign_extend.sv  --exe RISC_tb.cpp

make -j -C obj_dir/ -f VRISC.mk VRISC