And /the server is processing/ do
  Hellanzb.client.processing?.should == true
end

When /I pause the server/ do
  Hellanzb.client.pause!
end

Then /it should stop processing/ do
  Hellanzb.client.processing?.should == false
end

And /the server is paused/ do
  Hellanzb.client.pause!
  Hellanzb.client.processing?.should == false
end

When /I tell it to continue/ do
  Hellanzb.client.continue!
end

Then /it should start processing/ do
  Hellanzb.client.processing?.should == true
end

When /I shut down the server/ do
  Hellanzb.client.shutdown!
end

Then /the connection should fail/ do
  Hellanzb.client.connected?.should == false
end

When /^I clear all downloads$/ do
  Hellanzb.client.clear!
end

Then /^nothing should be downloading or queued$/ do
  Hellanzb.client.queue.empty?.should == true
  Hellanzb.client.downloading?.should == false
end

And /^the queue is empty$/ do
  Hellanzb.client.queue.clear!
end

When /^I cancel the current download$/ do
  Hellanzb.client.cancel!
end

Then /^there should be no current download$/ do
  Hellanzb.client.downloading?.should == false
end
