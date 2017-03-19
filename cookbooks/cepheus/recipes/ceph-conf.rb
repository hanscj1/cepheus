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

# This recipe allows to specify overrides to the ceph.conf settings in ceph-chef cookbook.
# Some values are part of 'ceph''config''global' which will create a k,v pair as is.
# Some values are specific variables that need to be set instead.

# NOTE: This file also updates the data in the ceph-chef cookbook
node.default['ceph']['cluster'] = node['cepheus']['ceph']['cluster']
node.default['ceph']['version'] = node['cepheus']['ceph']['repo']['version']['name']
node.default['ceph']['branch'] = node['cepheus']['ceph']['repo']['version']['branch']
node.default['ceph']['repo']['create'] = node['cepheus']['ceph']['repo']['create']

node.default['ceph']['mgr']['enable'] = node['cepheus']['ceph']['mgr']['enable']

# NOTE: If the version is 'hammer' then change owner and group to 'root'
if node['cepheus']['ceph']['repo']['version']['name'] == 'hammer'
    node.default['ceph']['owner'] = 'root'
    node.default['ceph']['group'] = 'root'
    node.default['ceph']['mode'] = 0o0755
else
    node.default['ceph']['owner'] = 'ceph'
    node.default['ceph']['group'] = 'ceph'
    node.default['ceph']['mode'] = 0o0750
end

node.default['ceph']['repo']['create'] = node['cepheus']['ceph']['repo']['create']

# System tunes
node.default['ceph']['system']['sysctl'] = node['cepheus']['system']['sysctl']

node.default['ceph']['network']['public']['cidr'] = node['cepheus']['network']['public']['cidr']
node.default['ceph']['network']['cluster']['cidr'] = node['cepheus']['network']['cluster']['cidr']

# An example of using sharding for RGW (small value for testing...). Putting it in the 'global' section.
# Default is 0 - no sharding index. Anything > 0 will initiate index sharding.
node.default['ceph']['config'] = node['cepheus']['ceph']['config']

# This recipe sets up ceph osd configuration information needed by the ceph cookbook recipes
node.default['ceph']['osd']['devices'] = node['cepheus']['ceph']['osd']['devices']
# OSD Add/Remove options/vars are set in main-osd* recipes

# Other OSD related items
node.default['ceph']['osd']['journal']['size'] = node['cepheus']['ceph']['osd']['journal']['size']
node.default['ceph']['osd']['size']['max'] = node['cepheus']['ceph']['osd']['size']['max']
node.default['ceph']['osd']['size']['min'] = node['cepheus']['ceph']['osd']['size']['min']
node.default['ceph']['osd']['crush'] = node['cepheus']['ceph']['osd']['crush']

node.default['ceph']['repo']['create'] = node['cepheus']['ceph']['repo']['create']
node.default['ceph']['pools']['pgs']['calc'] = node['cepheus']['ceph']['pools']['pgs']['calc']
node.default['ceph']['pools']['crush']['rule'] = node['cepheus']['ceph']['pools']['crush']['rule']
# 'names' may be deprecated soon. Here until then.
#node.default['ceph']['pools']['radosgw']['names'] = node['cepheus']['ceph']['pools']['radosgw']['names']
node.default['ceph']['pools']['radosgw']['pools'] = node['cepheus']['ceph']['pools']['radosgw']['pools']
node.default['ceph']['pools']['radosgw']['settings'] = node['cepheus']['ceph']['pools']['radosgw']['settings']
node.default['ceph']['pools']['pgs']['num'] = node['cepheus']['ceph']['pools']['pgs']['num']

node.default['ceph']['pools']['radosgw']['federated_enable'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['enable']
node.default['ceph']['pools']['radosgw']['federated_multisite_replication'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['multisite_replication']
node.default['ceph']['pools']['radosgw']['federated_enable_regions_zones'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['enable_regions_zones']
node.default['ceph']['pools']['radosgw']['federated_zone_instances'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['zone_instances']
#node.default['ceph']['pools']['radosgw']['federated_zones'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['zones']
node.default['ceph']['pools']['radosgw']['federated_regions'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['regions']
node.default['ceph']['pools']['radosgw']['federated_master_zone'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['master_zone']
node.default['ceph']['pools']['radosgw']['federated_master_zone_port'] = node['cepheus']['ceph']['pools']['radosgw']['federated']['master_zone_port']

# Erasure coding
node.default['ceph']['pools']['erasure_coding'] = node['cepheus']['ceph']['pools']['erasure_coding']

# This recipe sets up ceph rgw configuration information needed by the ceph cookbook recipes
node.default['ceph']['radosgw']['dns_name'] = node['cepheus']['domain_name']
node.default['ceph']['radosgw']['dns_name'] = node['cepheus']['domain_name']
node.default['ceph']['radosgw']['port'] = node['cepheus']['ceph']['radosgw']['port']
node.default['ceph']['radosgw']['keystone']['auth'] = node['cepheus']['ceph']['radosgw']['keystone']['auth']
node.default['ceph']['radosgw']['keystone']['accepted_roles'] = node['cepheus']['ceph']['radosgw']['keystone']['accepted_roles']
node.default['ceph']['radosgw']['keystone']['token_cache_size'] = node['cepheus']['ceph']['radosgw']['keystone']['token_cache_size']
node.default['ceph']['radosgw']['keystone']['revocation_interval'] = node['cepheus']['ceph']['radosgw']['keystone']['revocation_interval']
node.default['ceph']['radosgw']['keystone']['admin']['token'] = node['cepheus']['ceph']['radosgw']['keystone']['admin']['token']
node.default['ceph']['radosgw']['keystone']['admin']['url'] = node['cepheus']['ceph']['radosgw']['keystone']['admin']['url']
node.default['ceph']['radosgw']['keystone']['admin']['port'] = node['cepheus']['ceph']['radosgw']['keystone']['admin']['port']
node.default['ceph']['radosgw']['rgw_num_rados_handles'] = node['cepheus']['ceph']['radosgw']['rgw_num_rados_handles']
node.default['ceph']['radosgw']['civetweb_num_threads'] = node['cepheus']['ceph']['radosgw']['civetweb_num_threads']
node.default['ceph']['radosgw']['default_url'] = node['cepheus']['ceph']['radosgw']['default_url']

# NOTE: Need to double test why the node['cepheus']['ceph']['radosgw']['logs']['ops']['enable'] did not show the data.
node.default['ceph']['radosgw']['logs']['ops']['enable'] = true #node['cepheus']['ceph']['radosgw']['logs']['ops']['enable']
node.default['ceph']['radosgw']['logs']['usage']['enable'] = true #node['cepheus']['ceph']['radosgw']['logs']['usage']['enable']
node.default['ceph']['radosgw']['debug']['logs']['enable'] = node['cepheus']['ceph']['radosgw']['debug']['logs']['enable']
node.default['ceph']['radosgw']['debug']['logs']['level'] = node['cepheus']['ceph']['radosgw']['debug']['logs']['level']

# Add whatever users and buckets you want the cookbook to automatically set up for you in the  node['cepheus']['ceph']['radosgw']['users']
node.default['ceph']['radosgw']['users'] = node['cepheus']['ceph']['radosgw']['users']

node.default['ceph']['restapi']['url'] = node['cepheus']['ceph']['restapi']['url']
node.default['ceph']['restapi']['ip'] = node['cepheus']['ceph']['restapi']['ip']
node.default['ceph']['restapi']['port'] = node['cepheus']['ceph']['restapi']['port']
