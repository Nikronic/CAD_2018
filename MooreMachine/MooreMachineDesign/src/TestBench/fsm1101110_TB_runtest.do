SetActiveLib -work
comp -include "$dsn\src\fsm1101110.vhd" 
comp -include "$dsn\src\TestBench\fsm1101110_TB.vhd" 
asim +access +r TESTBENCH_FOR_fsm1101110 
wave 
wave -noreg input
wave -noreg clk
wave -noreg reset
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fsm1101110_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fsm1101110 
