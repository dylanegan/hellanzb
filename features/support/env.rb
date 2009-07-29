require 'spec/expectations'

require File.dirname(__FILE__) + '/../../lib/hellanzb'

$server = Hellanzb::Server.run(File.dirname(__FILE__) + '/hellanzb.client.conf')

at_exit do
  $server.stop
end
