SetActiveLib -work
comp -include "$dsn\src\SevenSegmentDecoder.vhd" 
comp -include "$dsn\src\TestBench\sevensegmentdecoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_sevensegmentdecoder 
wave 
wave -noreg sev_seg_out
wave -noreg binary_input
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\sevensegmentdecoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sevensegmentdecoder 
