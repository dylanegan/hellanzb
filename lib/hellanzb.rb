$:.unshift File.dirname(__FILE__)

%w( client nzb queue server ).each { |lib| require "hellanzb/#{lib}" }
