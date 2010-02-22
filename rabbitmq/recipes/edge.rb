#
# Cookbook Name:: rabbitmq
# Recipe:: edge
#
# Copyright 2009, tolingo GmbH
#
# All rights reserved - Do Not Redistribute
#

include_recipe "erlang"

package "mercurial"

%w{codegen server}.each do |com|

  edge_component "get_rabbitmq_#{com}" do
    component com
    revision node[:rabbitmq][:version]
  end

end

package "python-simplejson"

bash "make_rabbitmq_server" do
  cwd   "/usr/lib/erlang/lib/rabbitmq-server"
  user  "root"
  code  "make"
end

remote_file "/etc/init.d/rabbitmq-server" do
  source "rabbitmq-server"
  mode 0755
end