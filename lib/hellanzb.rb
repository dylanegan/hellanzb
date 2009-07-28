require 'xmlrpc/client'

module Hellanzb
  def self.connect(url)
    @client ||= Hellanzb::Client.new(url)
    @server = @client.server
  end

  def self.client
    @client
  end

  def self.server
    @server
  end
end

$:.unshift File.dirname(__FILE__)

%w( client nzb queue server ).each { |lib| require "hellanzb/#{lib}" }
