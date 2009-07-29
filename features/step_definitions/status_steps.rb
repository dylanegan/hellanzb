When /^I request the status$/ do
  @status = @client.status
end

Then /^I can read the status$/ do
  @status.hostname.should == `hostname`.strip
end
