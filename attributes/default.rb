#
# Cookbook Name:: munin
# Attributes:: default
#
# Copyright 2010-2013, Opscode, Inc.
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

default['munin']['sysadmin_email'] = 'ops@example.com'
default['munin']['cron_email'] = 'root'
default['munin']['server_role'] = 'monitoring'
default['munin']['server_list'] = nil
default['munin']['server_auth_method'] = 'openid'
default['munin']['multi_environment_monitoring'] = false

default['munin']['web_server'] = 'apache'
default['munin']['web_server_port'] = 80
default['munin']['public_domain'] = nil
default['munin']['update_increment'] = 5

case node['platform']
when 'arch'
  default['munin']['basedir'] = '/etc/munin'
  default['munin']['plugin_dir'] = '/usr/share/munin/plugins'
  default['munin']['docroot'] = '/srv/http/munin'
  default['munin']['cgiroot'] = '/srv/http/munin/cgi'
  default['munin']['dbdir'] = '/var/lib/munin'
  default['munin']['root']['group'] = 'root'
  default['munin']['service_name'] = 'munin-node'
  default['munin']['node']['log_dir'] = '/var/log/munin'
when 'centos', 'redhat', 'fedora', 'amazon', 'scientific'
  default['munin']['basedir'] = '/etc/munin'
  default['munin']['plugin_dir'] = '/usr/share/munin/plugins'
  default['munin']['docroot'] = '/var/www/html/munin'
  default['munin']['cgiroot'] = '/var/www/cgi-bin'
  default['munin']['dbdir'] = '/var/lib/munin'
  default['munin']['root']['group'] = 'root'
  default['munin']['service_name'] = 'munin-node'
  default['munin']['node']['log_dir'] = '/var/log/munin-node'
when 'freebsd'
  default['munin']['basedir'] = '/usr/local/etc/munin'
  default['munin']['plugin_dir'] = '/usr/local/share/munin/plugins'
  default['munin']['docroot'] = '/usr/local/www/munin'
  default['munin']['cgiroot'] = '/usr/local/www/munin/cgi'
  default['munin']['dbdir'] = '/usr/local/var/munin'
  default['munin']['root']['group'] = 'wheel'
  default['munin']['service_name'] = 'munin-node'
  default['munin']['node']['log_dir'] = '/var/log/munin'
when 'smartos'
  default['munin']['basedir'] = '/opt/local/etc/munin'
  default['munin']['plugin_dir'] = '/opt/local/lib/munin/plugins'
  default['munin']['docroot'] = '/var/www/html/munin'
  default['munin']['cgiroot'] = '/usr/www/cgi-bin'
  default['munin']['dbdir'] = '/var/lib/munin'
  default['munin']['root']['group'] = 'root'
  default['munin']['service_name'] = 'munin'
  default['munin']['node']['log_dir'] = '/var/log/munin'
else
  default['munin']['basedir'] = '/etc/munin'
  default['munin']['plugin_dir'] = '/usr/share/munin/plugins'
  default['munin']['docroot'] = '/var/www/munin'
  default['munin']['cgiroot'] = '/usr/lib/munin/cgi'
  default['munin']['dbdir'] = '/var/lib/munin'
  default['munin']['root']['group'] = 'root'
  default['munin']['service_name'] = 'munin-node'
  default['munin']['node']['log_dir'] = '/var/log/munin'
end

default['munin']['plugins'] = "#{default['munin']['basedir']}/plugins"
default['munin']['tmpldir'] = "#{default['munin']['basedir']}/templates"
default['munin']['max_graph_jobs'] = '6'
default['munin']['max_cgi_graph_jobs'] = '6'
default['munin']['max_processes'] = nil # use as many as necessary
