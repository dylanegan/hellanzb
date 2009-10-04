# Shared

And "there are items in the queue" do
  @queue = @client.queue
  1.upto(5) do |num|
    @queue.enqueue(File.expand_path(File.dirname(__FILE__) + "/../support/nzbs/#{num}.nzb"))
  end
  sleep 2
  @queue.update
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
  @queue.clear
end

Then /the queue should be empty/ do
  @queue.items.empty?.should == true
end

# Accessing

When /I access an item/ do
  @nzb = @queue.items.first
end

Then /I should get more details for that item/ do
  @nzb.name.should == "1"
end

When /^I dequeue an item$/ do
  @nzb = @queue.items.first
  @nzb.dequeue
end

Then /^it should no longer be in the queue$/ do
  @queue.items.include?(@nzb).should == false
end

When /^I move an item down the queue$/ do
  @nzb = @queue.items.first
  @position = @nzb.position
  @nzb.down
end

Then /^it should move (\w+) in the queue$/ do |position|
  @nzb.position.should == (@position + (position == 'up' ? -1 : 1))
end

When /^I move an item up the queue$/ do
  @nzb = @queue.items.last
  @position = @nzb.position
  @nzb.up
end

When /^I force an item to start downloading$/ do
  @currently_downloading = @client.currently_downloading
  @nzb = @queue.items.first
  @nzb.force
end

Then /^it should start downloading$/ do
  pending # need internats
  @client.currently_downloading.include?(@nzb.name).should == true
end

And /^the current download should move in to the queue$/ do
  pending # need internats
  @queue.items.include?(@currently_downloading).should == true
end

When /^I move an item to the end of the queue$/ do
  @nzb = @queue.items.first
  @nzb.last
end

Then /^it should be at the end of the queue$/ do
  @nzb.position.should == @queue.items.size
end

When /^I move an item to the second position$/ do
  @nzb = @queue.items.first
  @nzb.position = 2
end

Then /^it should be second in the queue$/ do
  @queue.items[1].id.should == @nzb.id
end

When /^I move an item to the front of the queue$/ do
  @nzb = @queue.items.last
  @nzb.next
end

Then /^it should be next to download$/ do
  @nzb.position.should == 1
end
