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

if node['cepheus']['init_style'] != 'upstart'
  package 'firewalld'
else
end


# Set permanent for all actions
# node.default['firewall']['firewalld']['permanent'] = true

# enable platform default firewall
# firewall 'default' do
#   action :install
#   enabled_zone :public
# end

# Force the rules etc to be saved
# firewall 'default' do
#   action :save
#   ignore_failure true
# end
