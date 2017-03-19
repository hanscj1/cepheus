#
# Author: Chris Jones <chris.jones@lambdastack.io>
# Cookbook: cepheus
#
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

include_recipe 'cepheus::ceph-conf'

# This recipe processes the actions in the cepheus - ceph - pools - radosgw - pools array

# We only use 'radosgw' so no need to set the activated flag like in ceph-chef pool creation schema.

# NOTE: DO NOT USE - EXPERIMENTAL ONLY!!!!

node['cepheus']['ceph']['pools']['radosgw']['pools'].each do |pool|
  pool['actions'].each do |action|
    if action['action'] == 'create' && action['type'] == 'erasure'
      execute "pool-actions-#{pool['name']}-#{action['action']}" do
        command lazy { "ceph osd pool create #{pool['name']} #{action['pg_num']} #{action['pg_num']} erasure #{action['profile']}" }
        ignore_failure true
      end
      next
    end
    # execute "pool-actions-#{pool['name']}-#{action['action']}" do
    #   command lazy { "ceph osd pool #{action['action']} #{pool['name']} #{action['key']} #{action['value']}" }
    #   ignore_failure true
    # end
  end
end
