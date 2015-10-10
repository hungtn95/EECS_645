@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim DM_tb_behav -key {Behavioral:sim_1:Functional:DM_tb} -tclbatch DM_tb.tcl -view C:/Users/Hung/Documents/Vivado/MIPS_data_memory/DM_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
