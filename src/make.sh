rm -rf obj_dir
rm -f VControlUnit.vcd

verilator --Wall --cc --trace control_unit_top.sv control_unit.sv instr_mem.sv --exe ControlUnit_tb.cpp

make -j -C obj_dir/ -f Vcontrol_unit_top.mk Vcontrol_unit_top