# This file is a general .xdc for the Basys3 rev B board
# To use it in a project:
# - uncomment the lines corresponding to used pins
# - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Constraints for CFGBVS
# Configuration bank voltage select (CFGBVS) must be set to VCCO or GND,  
# and CONFIG_VOLTAGE must be set to the correct configuration voltage,
# in order to determine the I/O voltage support for the pins in bank 0.
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Clock signal
set_property PACKAGE_PIN W5 [get_ports sys_clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports sys_clk]
