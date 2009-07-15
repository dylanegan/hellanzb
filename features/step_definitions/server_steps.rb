And /the server is processing/ do
  Hellanzb.server.processing?.should == true
end

When /I pause the server/ do
  Hellanzb.server.pause!
end

Then /it should stop processing/ do
  Hellanzb.server.processing?.should == false
end

And /the server is paused/ do
  Hellanzb.server.pause!
  Hellanzb.server.processing?.should == false
end

When /I tell it to continue/ do
  Hellanzb.server.continue!
end

Then /it should start processing/ do
  Hellanzb.server.processing?.should == true
end

When /I shut down the server/ do
  Hellanzb.server.shutdown!
end

Then /the connection should fail/ do
  Hellanzb.server.connected?.should == false
end

When /^I clear all downloads$/ do
  Hellanzb.server.clear!
end

Then /^nothing should be downloading or queued$/ do
  Hellanzb.server.queue.empty?.should == true
  Hellanzb.server.downloading?.should == false
end

And /^the queue is empty$/ do
  Hellanzb.server.queue.clear!
end

When /^I cancel the current download$/ do
  Hellanzb.server.cancel!
end

Then /^there should be no current download$/ do
  Hellanzb.server.downloading?.should == false
end
