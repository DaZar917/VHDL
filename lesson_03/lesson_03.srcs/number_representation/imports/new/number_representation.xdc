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
set_property PACKAGE_PIN R2 [get_ports {sign}]
	set_property IOSTANDARD LVCMOS33 [get_ports {sign}]

set_property PACKAGE_PIN W14 [get_ports {Magnitude[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[6]}]
    
set_property PACKAGE_PIN V15 [get_ports {Magnitude[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[5]}]
	
set_property PACKAGE_PIN W15 [get_ports {Magnitude[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[4]}]
    
set_property PACKAGE_PIN W17 [get_ports {Magnitude[3]}]		
    set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[3]}]
    
set_property PACKAGE_PIN W16 [get_ports {Magnitude[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[2]}]
        
set_property PACKAGE_PIN V16 [get_ports {Magnitude[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[1]}]
    
set_property PACKAGE_PIN V17 [get_ports {Magnitude[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Magnitude[0]}]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {Ones_complement[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[0]}]
set_property PACKAGE_PIN E19 [get_ports {Ones_complement[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[1]}]
set_property PACKAGE_PIN U19 [get_ports {Ones_complement[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[2]}]
set_property PACKAGE_PIN V19 [get_ports {Ones_complement[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[3]}]
set_property PACKAGE_PIN W18 [get_ports {Ones_complement[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[4]}]
set_property PACKAGE_PIN U15 [get_ports {Ones_complement[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[5]}]
set_property PACKAGE_PIN U14 [get_ports {Ones_complement[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[6]}]
set_property PACKAGE_PIN V14 [get_ports {Ones_complement[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Ones_complement[7]}]

set_property PACKAGE_PIN V13 [get_ports {Twos_complement[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[0]}]
set_property PACKAGE_PIN V3 [get_ports {Twos_complement[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[1]}]
set_property PACKAGE_PIN W3 [get_ports {Twos_complement[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[2]}]
set_property PACKAGE_PIN U3 [get_ports {Twos_complement[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[3]}]
set_property PACKAGE_PIN P3 [get_ports {Twos_complement[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[4]}]
set_property PACKAGE_PIN N3 [get_ports {Twos_complement[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[5]}]
set_property PACKAGE_PIN P1 [get_ports {Twos_complement[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[6]}]
set_property PACKAGE_PIN L1 [get_ports {Twos_complement[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Twos_complement[7]}]
	
#Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {Signed_magnitude[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[0]}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {Signed_magnitude[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[1]}]
#Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {Signed_magnitude[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[2]}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {Signed_magnitude[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[3]}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {Signed_magnitude[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[4]}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {Signed_magnitude[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[5]}]
#Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {Signed_magnitude[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[6]}]
#Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {Signed_magnitude[7]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Signed_magnitude[7]}]
