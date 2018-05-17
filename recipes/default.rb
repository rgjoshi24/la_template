#
# Cookbook:: la_template
# Recipe:: default
#
# Copyright:: 2018, Student Name, All Rights Reserved.

hello_httpd 'greet world' do
  greeting "Howdy"
end

execute 'systemctl stop httpd' do
  only_if { index_exists? }
end
