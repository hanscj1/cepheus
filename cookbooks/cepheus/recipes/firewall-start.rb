#
# Author:: Chris Jones <chris.jones@lambdastack.io>
# Cookbook Name:: cepheus
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

# NOTE: Not started by default. Must execute the recipe or include it in a role list.

if node['cepheus']['security']['firewall']['enable']
  execute 'firewalld-start' do
    command 'sudo systemctl start firewalld'
    only_if "sudo systemctl status firewalld | grep dead"
  end
else
  include_recipe 'cepheus::firewalld-stop'
end
