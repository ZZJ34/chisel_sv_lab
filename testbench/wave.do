onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/time_if/clk
add wave -noupdate /test_bench/time_if/reset_n
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_0/valid
add wave -noupdate -radix binary /test_bench/input_ch_0/data
add wave -noupdate /test_bench/input_ch_0/prioity
add wave -noupdate /test_bench/input_ch_0/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_1/valid
add wave -noupdate -radix binary /test_bench/input_ch_1/data
add wave -noupdate /test_bench/input_ch_1/prioity
add wave -noupdate /test_bench/input_ch_1/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_2/valid
add wave -noupdate -radix binary /test_bench/input_ch_2/data
add wave -noupdate /test_bench/input_ch_2/prioity
add wave -noupdate /test_bench/input_ch_2/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_3/valid
add wave -noupdate -radix binary /test_bench/input_ch_3/data
add wave -noupdate /test_bench/input_ch_3/prioity
add wave -noupdate /test_bench/input_ch_3/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_4/valid
add wave -noupdate -radix binary /test_bench/input_ch_4/data
add wave -noupdate /test_bench/input_ch_4/prioity
add wave -noupdate /test_bench/input_ch_4/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_5/valid
add wave -noupdate -radix binary /test_bench/input_ch_5/data
add wave -noupdate /test_bench/input_ch_5/prioity
add wave -noupdate /test_bench/input_ch_5/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_6/valid
add wave -noupdate -radix binary /test_bench/input_ch_6/data
add wave -noupdate /test_bench/input_ch_6/prioity
add wave -noupdate /test_bench/input_ch_6/ready
add wave -noupdate -divider <NULL>
add wave -noupdate /test_bench/input_ch_7/valid
add wave -noupdate -radix binary /test_bench/input_ch_7/data
add wave -noupdate /test_bench/input_ch_7/prioity
add wave -noupdate /test_bench/input_ch_7/ready
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /test_bench/output_ch/valid
add wave -noupdate -radix binary /test_bench/output_ch/data
add wave -noupdate /test_bench/output_ch/ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {324 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 291
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {442 ns}
