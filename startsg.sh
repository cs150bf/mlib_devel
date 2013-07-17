#!/bin/bash

export USER=chenhong

source /tools/flexlm/flexlm.sh
source /tools/xilinx/11.4/settings64.sh

export PLATFORM=lin64
export MATLAB=/tools/commercial/mathworks/matlab2009b
export XILINX=/tools/xilinx/11.4/ISE
export XILINX_EDK=/tools/xilinx/11.4/EDK
export XILINX_DSP=/tools/xilinx/11.4/DSP_Tools/lin64

export PATH=${XILINX}/bin/${PLATFORM}:${PATH}:${MATLAB}/bin
export LD_LIBRARY_PATH=${XILINX}/bin/${PLATFORM}:${XILINX}/lib/${PLATFORM}:${XILINX_DSP}/sysgen/lib:${LD_LIBRARY_PATH}
export LMC_HOME=${XILINX}/smartmodel/${PLATFORM}/installed_lin
export PATH=${LMC_HOME}/bin:${XILINX_DSP}/common/bin:${PATH}
export INSTALLMLLOC=/tools/mathworks/matlab2009b
export BEE2_XPS_LIB_PATH=/home/${USER}/workspace/casper/gbt/mlibrary_devel/gbt_hchen_lib/xps_lib
export MLIB_ROOT=/home/${USER}/workspace/casper/gbt/mlibrary_devel/gbt_hchen_lib/
export TEMP=/tmp/
export TMP=/tmp/
cd ~/workspace/casper/gbt/mlibrary_devel/gbt_hchen_lib

$MATLAB/bin/matlab
