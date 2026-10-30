# C04 la mach tuan tu co clock.
# Clock period 10 ns va IO delay 1 ns chi la GIA DINH PHAN TICH.

create_clock -name clk -period 10.0 [get_ports clk]

set_input_delay 1.0 -clock clk \
    [get_ports {high_th low_th rst_n sample_in}]

set_output_delay 1.0 -clock clk [all_outputs]
