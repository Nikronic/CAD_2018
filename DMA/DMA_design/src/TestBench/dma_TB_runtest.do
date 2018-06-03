SetActiveLib -work
comp -include "$dsn\src\dma.vhd" 
comp -include "$dsn\src\TestBench\dma_TB.vhd" 
asim +access +r TESTBENCH_FOR_dma 
wave 
wave -noreg clk
wave -noreg start
wave -noreg finish
wave -noreg addrSource
wave -noreg addrDest
wave -noreg copySize
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dma_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dma 
