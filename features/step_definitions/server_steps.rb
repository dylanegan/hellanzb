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
    pending
end

Then /^nothing should be downloading or queued$/ do
    pending
end

Given /^the queue is empty$/ do
    pending
end

When /^I cancel the current download$/ do
    pending
end

Then /^there should be no current download$/ do
    pending
end
