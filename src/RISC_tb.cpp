#include "VRISC.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
// #include"vbuddy.cpp"

int main(int argc, char **argv, char **env){
    int it;
    int clk;
    Verilated::commandArgs(argc,argv);
//  initialise top verilog instance
    VRISC* top = new VRISC;
// initialise trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open("VRISC-V.vcd");
    // init Vbuddy
    // if (vbdOpen()!=1) return (-1);
    // vbdHeader("RISC-V");
    // initialise simulation outputs
    top->clk =1;
    top->rst=0;

    // run simulation for many clock cycles
    int tick = 0;
    for(int i=0;i< 100000; i++){
        // Add to readme, remember to compelete part 2 of challenge
        // dump variables into VCD file and toggle clock
        for(clk=0;clk<2;clk++){
            // in ps
            tfp->dump (2*i+clk);
            // falling edge
            top->clk = !top->clk;
            top->eval ();
        }
        // Send count value to Vbuddy
        // vbdHex(4, (int(top->a0) >> 16) & 0xF);
        // vbdHex(3, (int(top->a0) >> 8) & 0xF);
        // vbdHex(2, (int(top->a0) >> 4) & 0xF);
        // vbdHex(1, int(top->a0) & 0xF);
        // vbdCycle(i+1);
        // top->clk =1;
        
        if(Verilated::gotFinish()) exit(0);
        
    }
    // vbdClose();
    tfp->close();
    exit(0);

}

