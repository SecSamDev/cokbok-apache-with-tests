#
# Cookbook:: apache
# Recipe:: configuration
#
# Copyright:: 2018, The Authors, All Rights Reserved.
user node['apache']['user'] do
  action :create
end
group node['apache']['group'] do
  members node['apache']['user']
  action :create
end
template node['apache']['index_file'] do
  source 'index.html.erb'
  mode '0755'
  owner node['apache']['user']
  group node['apache']['group']
end
