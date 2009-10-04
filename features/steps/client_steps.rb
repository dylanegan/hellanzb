Given "I connect to hellanzb" do
  @client = Hellanzb::Client.new('http://hellanzb:changeme@localhost:8771')
end

And /the server is processing/ do
  @client.processing?.should == true
end

When /I pause the server/ do
  @client.pause
end

Then /it should stop processing/ do
  @client.processing?.should == false
end

And /the server is paused/ do
  @client.pause
  @client.processing?.should == false
end

When /I tell it to continue/ do
  @client.continue
end

Then /it should start processing/ do
  @client.processing?.should == true
end

When /^I clear all downloads$/ do
  @client.clear
end

Then /^nothing should be downloading or queued$/ do
  @client.queue.empty?.should == true
  @client.downloading?.should == false
end

And /^the queue is empty$/ do
  @client.queue.clear
end

When /^I cancel the current download$/ do
  @client.cancel
end

Then /^there should be no current download$/ do
  @client.downloading?.should == false
end

And /^the maxrate is (\d+) KB\/s$/ do |maxrate|
  @client.maxrate.should == maxrate.to_i
end

When /^I change it to (\d+) KB\/s$/ do |maxrate|
  @client.maxrate = maxrate.to_i
end

Then /^it should be set to (\d+) KB\/s$/ do |maxrate|
  @client.maxrate.should == maxrate.to_i
end
