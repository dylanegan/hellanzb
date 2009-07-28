Given /^the config (.*)$/ do |config|
  @config = File.expand_path(File.dirname(__FILE__) + "/../support/#{config}")
end

When /^I run an instance$/ do
  @server = Hellanzb::Server.run(@config)
end

Then /^one should be running$/ do
  @server.running?.should == true
end

Given /^a URL (.*) and the server is running$/ do |url|
  @url = url
  Hellanzb::Server.run(File.expand_path(File.dirname(__FILE__) + '/../support/hellanzb.conf'))
end

When "I connect to the server" do
  @server = Hellanzb::Server.connect(@url)
end

Then /^I can talk to the server$/ do
  @server.call('system.listMethods').should == ["force", "process", "dequeue", "move", "down", "cancel", "shutdown", "asciiart", "aolsay", "setrarpass", "enqueueurl",  "next", "maxrate", "status", "enqueuenewzbin", "enqueue", "pause", "last", "clear", "list", "up", "continue", "system.methodHelp", "system.listMethods", "system.methodSignature"]
end
