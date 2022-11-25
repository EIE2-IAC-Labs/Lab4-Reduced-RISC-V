rm -rf obj_dir
rm -f VALUtop.vcd

verilator --Wall --cc --trace ALUtop.sv alu.sv reg_file.sv --exe ALUtop_tb.cpp

make -j -C obj_dir/ -f VALUtop.mk VALUtop