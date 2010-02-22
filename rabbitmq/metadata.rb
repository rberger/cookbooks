maintainer        "Runa Ops"
maintainer_email  "ops@runa.com"
license           "Apache 2.0"
description       "Installs and configures RabbitMQ server and optionally rabbitmq-stomp from source"
version           "0.1"
recipe            "rabbitmq::default", "Set up RabbitMQ from rabbitmq.com debian repository."
recipe            "rabbitmq::edge", "Set up RabbitMQ from source mercurial repository."
recipe            "rabbitmq::edge_stomp", "Set up RabbitMQ-stomp adapter from source mercurial repository."

%w{ubuntu debian}.each do |os|
  supports os
end

%w{ erlang ubuntu }.each do |cb|
  depends cb
end

attribute "rabbitmq",
  :display_name => "RabbitMQ",
  :description => "Hash of RabbitMQ attributes",
  :type => "hash"

attribute "rabbitmq/version",
  :display_name => "RabbitMQ tag/branch name",
  :description => "The RabbitMQ tag/branch name.  The default is default, the latest qa'd branch.",
  :default => "default"
    
  attribute "rabbitmq/stomp/version",
    :display_name => "RabbitMQ-stomp adapter tag/branch name",
    :description => "The RabbitMQ-stomp adapter tag/branch name.  The default is default, the latest qa'd branch.",
    :default => "default"

