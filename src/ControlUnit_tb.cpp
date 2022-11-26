#include "Vcontrol_unit_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    int it;
    int clk;
    Verilated::commandArgs(argc,argv);
//  initialise top verilog instance
    Vcontrol_unit_top* top = new Vcontrol_unit_top;
// initialise trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("Vcontrol_unit_top.vcd");

    // initialise simulation outputs
    top->A = 0;
    top->EQ = 0;
    

    // run simulation for many clock cycles
    int tick = 0;
    for(int i=0;i< 300; i++){
        // Add to readme, remember to compelete part 2 of challenge
        // dump variables into VCD file and toggle clock
        for(clk=0;clk<2;clk++){
            // in ps
            tfp->dump (2*i+clk);
            // falling edge
            top->eval ();
        }
        if (i % 4 == 0 || i == 0 ){
            top->A = i;
            top->EQ = 0;
        }
        if(Verilated::gotFinish()) exit(0);
        
    }
    tfp->close();
    exit(0);

}

