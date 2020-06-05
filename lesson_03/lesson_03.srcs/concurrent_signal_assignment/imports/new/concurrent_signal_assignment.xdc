# This file is a project specific .xdc for the Basys3 rev B board

# Create virtual clocks 
create_clock -period 10 -name virtclk

# Constraints for CFGBVS
# Configuration bank voltage select (CFGBVS) must be set to VCCO or GND,  
# and CONFIG_VOLTAGE must be set to the correct configuration voltage,
# in order to determine the I/O voltage support for the pins in bank 0.
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Switches
set_property PACKAGE_PIN R2 [get_ports {a}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN T1 [get_ports {b}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN U1 [get_ports {c}]					
        set_property IOSTANDARD LVCMOS33 [get_ports {c}]

# LEDs
set_property PACKAGE_PIN V14 [get_ports {y}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {y}]
