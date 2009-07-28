module Hellanzb
  class NoServerFound < StandardError; end
  class Server 
    attr_reader :queue

    def self.run(config)
      server = Hellanzb::Server.new
      server.run!(config) unless server.running?
      server
    end

    def self.connect(url)
      server = Hellanzb::Server.new
      raise NoServerFound("No server running") unless server.running?
      server.connect(url)
      server
    end

    def connect(url)
      @connection = XMLRPC::Client.new2(url)
    end

    def run!(config)
      `#{File.dirname(__FILE__) + '/../../bin/hellanzb'} #{File.expand_path(config)}`
    end

    def pid
      if File.exists?("/tmp/hellanzb.rb.pid")
        `cat /tmp/hellanzb.rb.pid`[/\d+/]
      else
        nil
      end
    end

    def running?
      pid && `ps #{pid} | wc -l`.to_i > 1
    end

    def continue!
      call('continue')
    end

    def processing?
      !call('status')['is_paused']
    end

    def pause!
      call('pause')
    end

    def shutdown!
      call('shutdown')
      @connection = nil
    end

    def call(command, *args)
      @connection.call(command, *args)
    end
  end
end
