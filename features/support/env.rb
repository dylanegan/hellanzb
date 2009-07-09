require 'spec/expectations'

require File.dirname(__FILE__) + '/../../lib/hellanzb'

require 'rr'
extend RR::Adapters::RRMethods

connection = XMLRPC::Client.new2('http://hellanzb:changeme@localhost:8760')
stub(XMLRPC::Client).new2 { connection }
stub(connection).call('system.methodList') { ["aolsay", "asciiart"] }
stub(connection).call('list') { ["queued_nzb_1"] }
