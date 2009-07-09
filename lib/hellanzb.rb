require 'xmlrpc/client'

module Hellanzb
  def self.setup(url)
    @server = Hellanzb::Server.new(url)
  end

  def self.server
    @server
  end
end

$:.unshift File.dirname(__FILE__)

%w( server ).each { |lib| require "hellanzb/#{lib}" }
