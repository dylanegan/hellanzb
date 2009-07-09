Given /the URL (.*)/ do |url|
  @url = url
end

When /I connect/ do
  Hellanzb.connect(@url)
end

Then /I should be able to talk to the server/ do
  Hellanzb.server.call('system.methodList').should == ["aolsay", "asciiart"]
end
