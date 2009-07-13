And /the server is processing/ do
  Hellanzb.server.processing?.should == true
end

When /I pause the server/ do
  stub(@connection).call('pause')
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
  stub(@connection).call('continue')
  Hellanzb.server.continue!
end

Then /it should start processing/ do
  Hellanzb.server.processing?.should == true
end

When /I shut down the server/ do
  stub(@connection).call('shutdown')
  Hellanzb.server.shutdown!
end

Then /the connection should fail/ do
  Hellanzb.server.connected?.should == false
end
