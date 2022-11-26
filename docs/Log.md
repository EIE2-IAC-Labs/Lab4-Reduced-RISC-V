# Logbook: Lab 4

**Quick Access**

<div id="individual-logs"></div>

* [Logbook: Program Counter](docs/Log_Pc.md)
* [Logbook: Control Unit & Others]()
* [Logbook: Register File & ALU]()
* [Logbook: Testbench]()

---

## Quick Start

To run our default tests:
1. `cd src`:<br> go to `src/` directory.
2. `source doit.sh` or `source doit.sh *device-name*`:<br> adding the device name as a positional argument runs the device specific testbenches otherwise it will run the testbench for the processor.

## Intro

The objective of Lab 4 was to create a Reduced RISC-V processor while agreeing upon the basic workflow of the team. 

We created the Workflow Document to document the rules we agree upon to make collaborating on Github easier. See [Appendix](#apen-a) for more information.

Designs of the proposed processor were split into four parts:

1. Program Counter.
2. Control Unit, Instruction Memory, Sign Extension Unit
3. Register File, ALU.
4. Testbenches.

All four parts were completed successfully and we have a working processor. See [Quick Access Section](#individual-logs) for challenges faced in each stage.

We made the following major design decisions:

* Instruction Memory: 8-bit address with 32-bit data.
* Register File: 5-bit address with 32-bit data.
* Data Memory: 8-bit address with 32-bit data.

## Challenges

1. Git/Github: 
  * Unfamiliarity with Git resulted in unruly commits on different branches.
  * Not having a .gitignore set in the first place results in generated files being committed.

2. Conventions:
  * Different people name things differently. Try to follow the graph as best as possible.

---

<div id="apen-a"></div>

***Appendix A: Workflow Document***

## Workflow

We work following the [Github flow](https://docs.github.com/en/get-started/quickstart/github-flow).

A quick description is as follows:
1. Create a branch for your component.
2. Commit source files to your branch.
3. Commit testbenches to your branch.
4. Commit logbooks to your branch.
5. Open a pull request into the `dev` branch.
6. Pull request is accepted.
7. File structure reordering on `dev` branch.
8. Merge `dev` branch into `main` branch.

We have the following branches:
* `main`: final presentation.
* `dev`: development branch, all feature branches merged here first.
* Other feature branches.

## Naming Conventions

### Git

**Repository** `<uni><year><shared?>-<course>-<id>-<descrip>`

* Self explanatory.

**Branch**: `<username>/<feature-or-component-name>`

* Branches are used to keep a clean workflow. 
* Feature branch naming is used in our workflow. Each component (or feature) should have its own branch. 
* E.g. `samuelpswang/program-counter`.

**Commit**: `<commit-type>: <description>`

* Commits are the basic units of changes. 
* Semantic commit system is used for clarity on commit messages in our workflow. Read more about semantic commits [here](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716). 
* E.g. `docs: update readme.md`.

### SystemVerilog

Naming conventions derived from those set down by [systemverilog.io](https://www.systemverilog.io/).

**Source Files (.sv)**: `<word>_<word>.sv`

* Source files are basic building blocks of hardware design. Use lower snake case for file names. 
* E.g. `my_sv_file.sv`.

**Parameter**: `MY_PARAMETER`

* Parameters are used to scale up designs. 
* Use upper snake case for parameters.

**Logic / Wire / Variables**: `my_logic`

* Logic or wires are used to connect between designs. 
* Use lower snake case for variables.

## Other Conventions

* DO follow set naming conventions.
* DO new line at the end of source files.

* DO NOT commas for the last parameter.
* DO NOT indent top-level blocks.

## File Structure

**Ideal Final File Structure**

```
root
├── docs/
│   ├── img/
│   ├── pdf/
│   ├── Lab-4.md
│   └── Log-*.md
├── src/
│   ├── alu/
│   ├── pc/
│   ├── control_unit/
│   ├── doit.sh
│   └── doit.config
├── .gitignore
└── README.md (symlink)
```

**Directories**

1. `docs`: directory that holds information about the project and its source files.
2. `src`: directory that holds the .sv source files.
3. `alu`, `pc`, ...: directory that holds the individual components.

**Files**

1. `README.md`: symlink to either Lab-4.md or Log.md.
2. `.gitignore`: standard file to ignore verilator obj_dir, .vcd, and other os files.
3. `doit.sh`: shell script that builds and runs the design, with easy debugging features.
4. `doit.config`: configuration file for verilator arguments, such as suppressing warnings and others.

