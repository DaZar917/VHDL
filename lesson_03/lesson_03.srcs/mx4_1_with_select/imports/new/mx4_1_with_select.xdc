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
# Port select S
set_property PACKAGE_PIN R2 [get_ports {S[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]
set_property PACKAGE_PIN T1 [get_ports {S[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]
	
# Data port D
set_property PACKAGE_PIN W17 [get_ports {D[3]}]		
    set_property IOSTANDARD LVCMOS33 [get_ports {D[3]}]
    
set_property PACKAGE_PIN W16 [get_ports {D[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D[2]}]
        
set_property PACKAGE_PIN V16 [get_ports {D[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D[1]}]
    
set_property PACKAGE_PIN V17 [get_ports {D[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {D[0]}]

# LEDs
set_property PACKAGE_PIN V14 [get_ports {y}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {y}]