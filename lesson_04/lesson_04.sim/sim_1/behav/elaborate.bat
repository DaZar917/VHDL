@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 54c317fb755548e693ab263ea568c6d4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot if_generate_tb_behav xil_defaultlib.if_generate_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
