# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :hello_httpd
property :greeting, :kind_of => String

default_action :create
action :create do
  package platform_package_httpd 
  service platform_service_httpd do
    action [ :enable, :start ]
  end

  template '/var/www/html/index.html' do
    cookbook 'la_template'
    source 'index.html.erb'
    group 'apache'
    owner 'apache'
    mode '0644'
    variables(
      greeting: greeting,
      greeting_scope: node['greeting_scope'],
      fqdn: node['fqdn']
    )
  end
end
