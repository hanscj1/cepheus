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
set +e

source vagrant_base.sh

# Removes and cleans ceph from all nodes
for vm in ${ceph_vms[@]}; do
  do_on_node $vm "sudo ceph-remove-clean"&
done

sleep 15

for vm in ${ceph_vms[@]}; do
  do_on_node $vm "sudo rm -f /usr/bin/ceph-remove-clean"
done
