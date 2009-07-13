Given /the URL (.*)/ do |url|
  @url = url
end

When /I connect/ do
  @connection = XMLRPC::Client.new2('http://hellanzb:changeme@localhost:8760')
  stub(XMLRPC::Client).new2 { @connection }
  stub(@connection).call('list') { [ { 'id' => 1, 'nzbName' => 'My First NZB', 'is_par_recovery' => false } ] }
  time = Time.now
  stub(@connection).call('status') do
    { "queued_mb" => 0, "percent_complete" => 0,
      "time" => XMLRPC::DateTime.new(time.year, time.month, time.day, time.hour, time.min, time.sec),
      "total_dl_nzbs"=>0, "is_paused"=>false, "maxrate"=>0,
      "rate"=>0, "currently_downloading"=>[], "currently_processing"=>[],
      "total_dl_files"=>0, "version"=>"0.13", "eta"=>0,
      "config_file"=>"/opt/local/etc/hellanzb.conf", "hostname"=>"omar.local",
      "queued"=>[], "uptime"=>"00:00",
      "log_entries"=>[{"INFO"=>"hellanzb v0.13 (config = /opt/local/etc/hellanzb.conf)"},
                      {"INFO"=>"(giganews) Opening 20 connections..."},
                      {"INFO"=>"hellanzb - Now monitoring queue..."}],
      "total_dl_segments"=>0, "total_dl_mb"=>0}
  end
  Hellanzb.connect(@url)
end

Then /I should be able to talk to the server/ do
  stub(@connection).call('system.methodList') { ["aolsay", "asciiart"] }
  Hellanzb.server.call('system.methodList').should == ["aolsay", "asciiart"]
end
