SetActiveLib -work
comp -include "$dsn\src\priorityEncoder.vhd" 
comp -include "$dsn\src\TestBench\priorityencoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_priorityencoder 
wave 
wave -noreg a
wave -noreg z
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\priorityencoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_priorityencoder 
