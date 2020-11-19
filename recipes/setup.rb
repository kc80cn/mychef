# cookbook:: linux workstation setup
# recipe:: setup.rb
#
package 'firefox'
package 'ssh'
#package 'docker.io'
package 'net-tools'
package 'git'
package 'ntp'
package 'nano'
package 'nmap'
package 'vim'
package 'proxychains'
package 'tree' do
	action :install
end

service 'ntp' do
	action [:enable, :start]
end

#service 'ssh' do
#	action [:enable, :start]
#end

#file '/etc/motd' do
#        content " this server is the property of CHEF.....
#        #{node['current_user']}
#        #{node['hostname']}
#        #{node['ipaddress']}
#        #{node['memory']['total']}
#        #{node['cpu']['0']['model_name']}
#        "
#        mode '666'
#
#end

template '/etc/motd' do
       variables(name: 'KCGao',email: 'kcgao@poal.co.nz', :department => 'Security Operation Centre')
       source 'motd.erb' 
       action :create
end

user 'user02' do
  comment 'user02'
  uid '222'
  home '/home/user02'
  shell '/bin/bash'
end

group 'admins' do
  members ['root','user02']
  append true
end

















