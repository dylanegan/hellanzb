module Hellanzb
  class Server
    attr_reader :queue

    def initialize(url)
      @connection = XMLRPC::Client.new2(url)
      @queue = Hellanzb::Queue.new(call('list'), self)
    end

    def clear!(all = true)
      @connection.call('clear', all)
    end

    def connected?
      !@connection.nil?
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
