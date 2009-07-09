Given /the URL (.*)/ do |url|
  @url = url
end

When /I setup/ do
  Hellanzb.setup(@url)
end

Then /I should be able to talk to the server/ do
  Hellanzb.server.call('system.methodList').should == ["aolsay", "asciiart"]
end
