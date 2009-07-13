require 'spec/expectations'

require File.dirname(__FILE__) + '/../../lib/hellanzb'

Thread.new do
  `hellanzb.py -c #{File.expand_path(File.dirname(__FILE__) + '/hellanzb.conf')}`
end

sleep 1

at_exit do
  Hellanzb.server.shutdown!
end
