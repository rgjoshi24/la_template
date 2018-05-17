#
# Cookbook:: la_template
# Recipe:: default
#
# Copyright:: 2018, Student Name, All Rights Reserved.

package platform_package_httpd

service platform_service_httpd do
  action [ :enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  group 'apache'
  owner 'apache' 
  mode '0644'
  variables(
    greeting: node['greeting'],
    greeting_scope: node['greeting_scope'],
    fqdn: node['fqdn']
  )
end

execute 'systemctl stop httpd' do
  only_if { index_exists? }
end
