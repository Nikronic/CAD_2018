SetActiveLib -work
comp -include "$dsn\src\registerSixteenBit.vhd" 
comp -include "$dsn\src\TestBench\registersixteenbit_TB.vhd" 
asim +access +r TESTBENCH_FOR_registersixteenbit 
wave 
wave -noreg i
wave -noreg l
wave -noreg clr
wave -noreg clk
wave -noreg o
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\registersixteenbit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_registersixteenbit 
