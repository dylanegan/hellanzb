require 'spec/expectations'

require File.dirname(__FILE__) + '/../../lib/hellanzb'

at_exit do
  Hellanzb.server.shutdown!
end
