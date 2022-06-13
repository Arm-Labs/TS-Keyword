#!/bin/bash

#  Copyright (c) 2021-2022 Arm Limited. All rights reserved.
#  SPDX-License-Identifier: Apache-2.0
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

BUILD_PATH="build"
TARGET="Corstone-300"
TARGET_OPTIONS=""

# Time in wall-clock seconds to terminate FVP run
TIME_LIMIT_VAL=""
TIME_LIMIT_OPT="--timelimit "
FVP_BIN=""

numericRE='^[0-9]+$'

function show_usage {
    cat <<EOF
Usage: $0 [options] example

Run an example.

Options:
    -h,--help       Show this help
    -p,--path       Build path
    -t,--target     Target to run
    -l,--timelimit  Max Wall-clock time in seconds for simulation to run

Examples:
    blinky
    kws
EOF
}

SHORT=p:t:,h
LONG=path:,target:,timelimit:,help
OPTS=$(getopt -n run --options $SHORT --longoptions $LONG -- "$@")

eval set -- "$OPTS"

while :
do
  case "$1" in
    -h | --help )
      show_usage
      exit 0
      ;;
    -p | --path )
      BUILD_PATH=$2
      shift 2
      ;;
    -l | --timelimit )
      if ! [[ $2 =~ ${numericRE} ]] ; then
        echo "error: timelimit arg ... not a number" >&2
        show_usage
        exit 1
      else
        TIME_LIMIT_VAL=$2
        shift 2
      fi
      ;;
    -t | --target )
      TARGET=$2
      shift 2
      ;;
    --)
      shift;
      break
      ;;
    *)
      echo "Unexpected option: $1"
      show_usage
      exit 2
      ;;
  esac
done


case "$1" in
    kws)    ;;
    blinky) ;;
    *)
        echo "Usage: $0 <blinky|kws>" >&2
        exit 1
        ;;
esac

case "$TARGET" in
    Corstone-300 )
      FVP_BIN="VHT_Corstone_SSE-300_Ethos-U55"
      ;;
    Corstone-310 )
#      TARGET_OPTIONS="-C cpu0.CFGDTCMSZ=10 -C cpu0.CFGITCMSZ=10 -C cpu0.INITNSVTOR=0x00000000 -C cpu0.INITSVTOR=0x10000000"
#      FVP_BIN="VHT_Corstone-Polaris"
#      FVP_BIN="VHT_Corstone_SSE-310_Ethos-U55"
      FVP_BIN="VHT_Corstone_SSE-310"
      ;;
    *)
      echo "Invalid target <Corstone-300|Corstone-310>"
      show_usage
      exit 2
      ;;
esac

# check to make sure arg is actually set with a value (from either command line or default)
if ! ( [ -z "${TIME_LIMIT_VAL-}" ] || [ "${TIME_LIMIT_VAL:-xxx}" = "xxx" ] )
then
  #echo "TIME_LIMIT_VAL is set ${TIME_LIMIT_VAL}"
  TIME_LIMIT_OPT+=${TIME_LIMIT_VAL}
else
  TIME_LIMIT_OPT=""
fi

set -x

VSI_PY_PATH=$PWD/lib/VHT/interface/audio/python
OPTIONS="-V $VSI_PY_PATH -C mps3_board.visualisation.disable-visualisation=1 -C mps3_board.smsc_91c111.enabled=1 -C mps3_board.hostbridge.userNetworking=1 -C cpu0.semihosting-enable=1 -C mps3_board.telnetterminal0.start_telnet=0 -C mps3_board.uart0.out_file="-"  -C mps3_board.uart0.unbuffered_output=1 --stat  -C mps3_board.DISABLE_GATING=1"

# NOTE: hardcoded run time to 7 wall clock seconds...TODO: make this a command line option
$FVP_BIN $OPTIONS $TIME_LIMIT_OPT $TARGET_OPTIONS -a cpu0*="$BUILD_PATH/bootloader/bl2.axf" --data "$BUILD_PATH/secure_partition/tfm_s_signed.bin"@0x38000000 --data "$BUILD_PATH/$1/$1_signed.bin"@0x28060000
