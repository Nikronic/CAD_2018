SetActiveLib -work
comp -include "$dsn\src\ShiftRegisterSixteenBits.vhd" 
comp -include "$dsn\src\TestBench\shiftregistersixteenbits_TB.vhd" 
asim +access +r TESTBENCH_FOR_shiftregistersixteenbits 
wave 
wave -noreg Clk
wave -noreg Reset
wave -noreg Load
wave -noreg ShR
wave -noreg ShL
wave -noreg DataIn
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\shiftregistersixteenbits_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_shiftregistersixteenbits 
