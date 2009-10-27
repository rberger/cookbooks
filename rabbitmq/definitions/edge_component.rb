#
# Cookbook Name:: rabbitmq
# Definition:: edge_component
#
# Copyright 2009, tolingo GmbH
#
# All rights reserved - Do Not Redistribute
#

define :edge_component do

  package "mercurial"
  
  com = params[:component]
  
  if File.exists?("/usr/lib/erlang/lib/rabbitmq-#{com}")
    bash "pull_rabbitmq_#{com}" do
      cwd   "/usr/lib/erlang/lib/rabbitmq-#{com}"
      user  "root"
      code  "hg pull"
    end
  else
    bash "clone_rabbitmq_#{com}" do
      cwd   "/usr/lib/erlang/lib"
      user  "root"
      code  "hg clone http://hg.rabbitmq.com/rabbitmq-#{com}/"
    end  
  end
  
end