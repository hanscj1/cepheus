name 'cepheus'
maintainer 'Chris Jones'
maintainer_email 'chris.jones@lambdastack.io'
license 'Apache v2.0'
description 'Powerful and flexible automated build system for Ceph that includes full management end-to-end.'
long_description 'Powerful and flexible automated build system for Ceph that includes full management end-to-end. Requires github.com/ceph/ceph-chef'
version '1.1.1'

depends "chef-client", ">= 2.2.2"
depends "cron", ">= 1.7.6"
depends "ntp", ">= 1.10.0"
depends "ceph-chef", ">= 1.1.1"
# depends "firewall", ">= 2.4"
depends "sudo", ">= 2.7.2"
depends "collectd", ">= 2.2.2"
depends "collectd_plugins", ">= 2.1.1"
depends "yumgroup", ">= 0.5.0"

supports 'redhat', '>= 7.2'
supports 'centos', '>= 7.2'

issues_url 'https://github.com/cepheus-io/cepheus/issues'
source_url 'https://github.com/cepheus-io/cepheus'
