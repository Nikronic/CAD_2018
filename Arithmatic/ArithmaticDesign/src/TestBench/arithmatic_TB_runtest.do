SetActiveLib -work
comp -include "$dsn\src\Arithmatic.vhd" 
comp -include "$dsn\src\TestBench\arithmatic_TB.vhd" 
asim +access +r TESTBENCH_FOR_arithmatic 
wave 
wave -noreg input
wave -noreg sign_bit
wave -noreg unsigned_output
wave -noreg ones
wave -noreg twos
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\arithmatic_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_arithmatic 
