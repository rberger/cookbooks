#
# Cookbook Name:: rabbitmq
# Recipe:: edge
#
# Copyright 2009, tolingo GmbH
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rabbitmq::edge'

edge_component "get_rabbitmq_stomp" do
  component 'stomp'
end

bash "make_rabbitmq_stomp" do
  cwd   "/usr/lib/erlang/lib/rabbitmq-stomp"
  user  "root"
  code  "make"
end

service "stop_rabbitmq_server" do
  service_name "rabbitmq-server"
  supports :restart => true
  action [ :stop ]
end
    
remote_file "/etc/default/rabbitmq" do
  source "rabbitmq"
  mode 0755
end

service "start_rabbitmq_server" do
  service_name "rabbitmq-server"
  supports :restart => true
  action [ :start ]
end