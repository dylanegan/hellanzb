When /^I access the first item$/ do
  @nzb = @queue.items.first
end

Then /^it should be an NZB$/ do
  @nzb.class.should == Hellanzb::Nzb
end
