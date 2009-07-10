# Shared

And /there are items in the queue/ do
  stub(@connection).call('list') { [ { 'id' => 1, 'nzbName' => 'My First NZB', 'is_par_recovery' => false } ] }
  @queue = Hellanzb.server.queue
  @queue.update!
  @queue.items.empty?.should == false
end

# Checking

When /I inspect the queue/ do
  @queue.class.should == Hellanzb::Queue
end

Then /I should see a list of queued NZBs/ do
  @queue.items.first.class.should == Hellanzb::Nzb
end

# Clearing

When /I clear the queue/ do
  stub(@connection).call('clear', false)
  stub(@connection).call('list') { [] }
  @queue.clear!
end

Then /the queue should be empty/ do
  @queue.items.empty?.should == true
end

# Accessing

When /I access an item/ do
  @nzb = @queue.items.first
end

Then /I should get more details for that item/ do
  @nzb.name.should == "My First NZB"
end
