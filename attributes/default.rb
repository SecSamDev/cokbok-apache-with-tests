case node['platform']
when 'ubuntu'
  default['apache']['package_name'] = 'apache2'
  default['apache']['user'] = 'www-data'
  default['apache']['group'] = 'www-data'
  default['apache']['service_name'] = 'apache2'
else
  default['apache']['package_name'] = 'httpd'
  default['apache']['user'] = 'apache'
  default['apache']['group'] = 'apache'
  default['apache']['service_name'] = 'httpd'
end
default['apache']['index_file'] = '/var/www/html/index.html'
