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

When /^I dequeue an item$/ do
  @nzb = @queue.items.first
  stub(@connection).call('dequeue', 1)
  stub(@connection).call('list') { [] }
  @nzb.dequeue!
end

Then /^it should no longer be in the queue$/ do
  @queue.items.include?(@nzb).should == false
end

When /^I move an item down the queue$/ do
    pending
end

Then /^it should change its position in the queue$/ do
    pending
end

When /^I move an item up the queue$/ do
    pending
end

When /^I force an item to start downloading$/ do
    pending
end

Then /^it should start downloading$/ do
    pending
end

Then /^the current download should move in to the queue$/ do
    pending
end

When /^I move an item to the end of the queue$/ do
    pending
end

Then /^it should be at the end of the queue$/ do
    pending
end

When /^I move an item to the second position$/ do
    pending
end

Then /^it should be second in the queue$/ do
    pending
end

When /^I move an item to the front of the queue$/ do
    pending
end

Then /^it should be next to download$/ do
    pending
end
