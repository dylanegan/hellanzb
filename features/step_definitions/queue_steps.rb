Given /there are items in the queue/ do
end

When /I inspect the queue/ do
  Hellanzb.connect('http://hellanzb:changeme@localhost:8760')
  @queue = Hellanzb.server.queue
end

Then /I should see a list of queued NZBs/ do
  @queue.items.should == ["queued_nzb_1"]
end
