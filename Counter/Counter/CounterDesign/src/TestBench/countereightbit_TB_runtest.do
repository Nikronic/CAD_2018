SetActiveLib -work
comp -include "$dsn\src\counterEightBit.vhd" 
comp -include "$dsn\src\TestBench\countereightbit_TB.vhd" 
asim +access +r TESTBENCH_FOR_countereightbit 
wave 
wave -noreg Clk
wave -noreg CountEn
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\countereightbit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_countereightbit 
