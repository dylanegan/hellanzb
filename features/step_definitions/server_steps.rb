Given /^the config (.*)$/ do |config|
  @config = File.expand_path(File.dirname(__FILE__) + "/../support/#{config}")
end

When /^I run an instance$/ do
  @server = Hellanzb::Server.run(@config)
end

Then /^one should be running$/ do
  @server.running?.should == true
  @server.stop!
end
