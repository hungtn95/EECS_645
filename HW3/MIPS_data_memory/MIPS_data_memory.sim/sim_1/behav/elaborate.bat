@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto ef99f9901871410bb4fa074253946474 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot DM_tb_behav xil_defaultlib.DM_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
