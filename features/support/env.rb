require 'rr'
require 'spec/expectations'

require File.dirname(__FILE__) + '/../../lib/hellanzb'

World do
  extend RR::Adapters::RRMethods
end
