#
# Cookbook:: apache
# Recipe:: ohai_apache_modules
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'apache::default'
ohai_plugin 'apache_modules'
