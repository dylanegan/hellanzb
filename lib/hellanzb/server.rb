module Hellanzb
  class Server 
    def self.run(config)
      server = Hellanzb::Server.new(config)
      server.start! unless server.running?
      server
    end

    def initialize(config)
      @config = config
    end

    def start!
      `#{File.dirname(__FILE__) + '/../../bin/hellanzb'} #{File.expand_path(@config)} #{pid_file}`
    end

    def pid
      if File.exists?(pid_file)
        `cat #{pid_file}`[/\d+/]
      else
        nil
      end
    end

    def running?
      pid && `ps #{pid} | wc -l`.to_i > 1
    end

    def stop!
      `kill #{pid} && rm #{pid_file}` if running?
    end

    def pid_file
      return "/tmp/#{@config.gsub(/(\/|\.| )/, '')}.pid"
    end
  end
end
