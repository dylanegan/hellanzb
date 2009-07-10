Given /the URL (.*)/ do |url|
  @url = url
end

When /I connect/ do
  @connection = XMLRPC::Client.new2('http://hellanzb:changeme@localhost:8760')
  stub(XMLRPC::Client).new2 { @connection }
  stub(@connection).call('list') { [ { 'id' => 1, 'nzbName' => 'My First NZB', 'is_par_recovery' => false } ] }
  Hellanzb.connect(@url)
end

Then /I should be able to talk to the server/ do
  stub(@connection).call('system.methodList') { ["aolsay", "asciiart"] }
  Hellanzb.server.call('system.methodList').should == ["aolsay", "asciiart"]
end
