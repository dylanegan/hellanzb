require 'xmlrpc/client'

module Hellanzb
  def self.connect(url)
    @client ||= Hellanzb::Client.new(url)
  end

  def self.client
    @client
  end
end

$:.unshift File.dirname(__FILE__)

%w( client nzb queue ).each { |lib| require "hellanzb/#{lib}" }
