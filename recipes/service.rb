#
# Cookbook:: apache
# Recipe:: service
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service node['apache']['service_name'] do
  action [:start, :enable]
end
