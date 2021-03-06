#!/bin/bash
#
# Author: Chris Jones <chris.jones@lambdastack.io>
# Copyright 2017, LambdaStack
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# IMPORTANT: This script DOES NOT shut the ceph-osd services down for the given OSDs. It is assumed that they are
# already down either by you or the node has failed.

# IMPORTANT: This script will remove ALL OSDs for the given node where the OSDs are marked down.
# The default number of drives in the given node is 12 but you can pass in however many drives are in your system
# for example, ./remove_all_osds_for_node.sh mynodename 36

# AFTER you have removed all of the OSDs for the given node then you can PXE boot the node again and if that fails you
# will need to replace it!!

# If anything fails then the script will exit. You can then run ./remove_osd.sh for the specific OSD one at a time.
set -e

# NOTE: MUST be run on the OSD node itself!

# osd is the osd number like 100 or 233 or something and not like 'osd.83'
osd=$1
# rack number is in the format of 1, 2, 3...
rack=$2
# check `ceph osd tree` to get weight value
WEIGHT=$3
data_type=${4:-hdd}

if [[ -z $osd ]]; then
  echo 'Must pass in a valid OSD number.'
  exit 1
fi

if [[ -z $rack ]]; then
  echo 'Must pass in a valid rack number.'
  exit 1
fi

if [[ -z $WEIGHT ]]; then
  echo 'Must pass in a valid WEIGHT (see `ceph osd tree for valid weight` - assuming same size drive).'
  exit 1
fi

if [[ -z $data_type ]]; then
  echo 'Must pass in a valid root data type - defaults to hdd.'
  exit 1
fi

# SIZE=`df -k | grep '/ceph-$osd' | awk '{print $2}'`
# WEIGHT=`echo "scale=4; $SIZE/1000000000.0" | bc -q`
# We already know the weight based on `ceph osd tree`

ceph osd crush create-or-move $osd $WEIGHT root=$data_type rack=rack$rack host=$(hostname)
