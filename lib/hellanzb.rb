require 'xmlrpc/client'

module Hellanzb
  def self.connect(url)
    @server ||= Hellanzb::Server.new(url)
  end

  def self.server
    @server
  end
end

$:.unshift File.dirname(__FILE__)

%w( nzb queue server ).each { |lib| require "hellanzb/#{lib}" }
