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

set -e

# SUDO this script
# Device name needs to be in the format of 'sdX' and not '/dev/sdX'

device=$1

if [[ -z $device ]]; then
  echo 'Must pass in a valid device name.'
  exit 1
fi

echo 1 > /sys/block/$device/device/delete

# May need to do something like afterwards:
# udevadm trigger...
