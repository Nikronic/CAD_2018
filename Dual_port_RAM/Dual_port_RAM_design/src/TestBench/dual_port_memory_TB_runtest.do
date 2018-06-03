SetActiveLib -work
comp -include "$dsn\src\dual_port_memory.vhd" 
comp -include "$dsn\src\TestBench\dual_port_memory_TB.vhd" 
asim +access +r TESTBENCH_FOR_dual_port_memory 
wave 
wave -noreg clk
wave -noreg cs1
wave -noreg we1
wave -noreg cs2
wave -noreg we2
wave -noreg data1
wave -noreg data2
wave -noreg addr1
wave -noreg addr2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dual_port_memory_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dual_port_memory 
