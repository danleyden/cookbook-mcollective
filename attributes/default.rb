#
# Cookbook Name:: mcollective
# Attributes:: default
#
# Copyright 2011, Zachary Stevens
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# version of mcollective to install
default['mcollective']['package']['version'] = nil

# Security provider to use
default['mcollective']['securityprovider'] = "psk"

# pre-shared key
default['mcollective']['psk'] = "unset"

# STOMP server details
default['mcollective']['connector'] = "activemq"
default['mcollective']['stomp']['hostname'] = "localhost"
default['mcollective']['stomp']['port'] = "6163"
default['mcollective']['stomp']['username'] = "mcollective"
default['mcollective']['stomp']['password'] = "marionette"

# Logging
default['mcollective']['logfile'] = "/var/log/mcollective.log"
default['mcollective']['loglevel'] = "info"


default['mcollective']['site_plugins'] = "/etc/mcollective/site_plugins/mcollective"

# Fact Source
# The default option configures MCollective to read a YAML file
# produced by a Chef handler, containing a configurable list of
# facts.  This gives the best MCollective performance, at the cost of
# less fresh data (updated only as frequently as you run Chef).
#
# Set this to 'ohai' to instead use the opscodeohai MCollective Fact
# plugin.
default['mcollective']['factsource'] = 'yaml'

# Ohai keys to include in the YAML fact list.
default['mcollective']['fact_whitelist'] = [
                                            'fqdn',
                                            'hostname',
                                            'domain',
                                            'ipaddress',
                                            'macaddress',
                                            'os',
                                            'os_version',
                                            'platform',
                                            'platform_version',
                                            'ohai_time',
                                            'uptime',
                                            'uptime_seconds',
                                            'chef_packages',
                                            'keys',
                                            'instmaint',
                                            'virtualization',
                                            'cpu',
                                            'memory'
                                           ]

# MCollective plugin location (created by the packages)
case platform
when "debian","ubuntu"
  default['mcollective']['libdir'] = "/usr/share/mcollective/plugins"
when "redhat","centos","fedora"
  default['mcollective']['libdir'] = "/usr/libexec/mcollective"
end

## Cookbook plumbing
# Recipe used to install common components
default['mcollective']['install_recipe']['common'] = 'mcollective::install_common_pkg'
# Recipe used to install server components
default['mcollective']['install_recipe']['server'] = 'mcollective::install_server_pkg'
# Recipe used to install client components
default['mcollective']['install_recipe']['client'] = 'mcollective::install_client_pkg'
# Whether to enable the puppetlabs apt/yum repo when installing from packages.
default['mcollective']['enable_puppetlabs_repo'] = true

