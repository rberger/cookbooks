#
# Cookbook Name:: rabbitmq
# Recipe:: default
#
# Copyright 2009, tolingo GmbH
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ubuntu"
include_recipe "erlang"

case node[:platform]
  
  when "debian", "ubuntu"
    
    bash "install_rabbitmq_repository" do
      user "root"
      cwd "/etc/apt"
      code 'echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list'
    end    
    
    bash "install_rabbitmq_signing_key" do
      user "root"
      cwd "/tmp"
      code 'curl "http://www.rabbitmq.com/rabbitmq-signing-key-public.asc" | apt-key add -'
    end
    
    execute "apt-get-update" do
      command "apt-get update"
    end

    package "rabbitmq-server"

end