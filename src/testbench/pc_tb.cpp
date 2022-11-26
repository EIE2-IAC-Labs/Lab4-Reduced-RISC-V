#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vpc.h"

#define MAX_SIM_CYC 100

int main(int argc, char **argv, char **env) {
  int simcyc;
  int tick;

  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);

  Vpc* top = new Vpc;
  VerilatedVcdC* tfp = new VerilatedVcdC;

  top->trace(tfp, 99);
  tfp->open("pc.vcd");

  top->clk = 1;
  top->rst = 0;

  // branch 20 every cycle
  top->PCsrc = 1;
  top->ImmOp = 20;

  for (simcyc = 0; simcyc < MAX_SIM_CYC; simcyc++) {
    for (tick = 0; tick < 2; tick++) {
      tfp->dump(2*simcyc+tick);
      top->clk = !top->clk;
      top->eval();
    }
    if (Verilated::gotFinish()) exit(0);
  }

  tfp->close();
  exit(0);
}
