Given /the URL (.*)/ do |url|
  @url = url
end

When "I connect" do
  Hellanzb.connect(@url)
end

Given "I connect to hellanzb" do
  Hellanzb.connect('http://hellanzb:changeme@localhost:8771')
end

Then "I should be able to talk to the server" do
  Hellanzb.client.call('system.listMethods').should == ["force", "process", "dequeue", "move", "down", "cancel", "shutdown", "asciiart", "aolsay", "setrarpass", "enqueueurl", "next", "maxrate", "status", "enqueuenewzbin", "enqueue", "pause", "last", "clear", "list", "up", "continue", "system.methodHelp", "system.listMethods", "system.methodSignature"]
end
