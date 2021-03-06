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

# FirewallD is setup for rhel and iptables are used for ubuntu

# Will override the sshd_config that is present for better practices on security.
template "/etc/ssh/sshd_config" do
  source 'sshd_config.erb'
  group 'root'
  user 'root'
  mode '0600'
end

# Banner can be changed if desired
# template '/etc/banner' do
#   source 'motd.tail.erb'
#   mode 00640
# end
