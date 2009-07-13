module Hellanzb
  class Server
    attr_reader :queue

    def initialize(url)
      @connection = XMLRPC::Client.new2(url)
      @queue = Hellanzb::Queue.new(call('list'), self)
      @processing = !call('status')['is_paused']
    end

    def clear!(all = true)
      @connection.call('clear', all)
    end

    def connected?
      !@connection.nil?
    end

    def continue!
      call('continue')
      @processing = true
    end

    def processing?
      @processing
    end

    def pause!
      call('pause')
      @processing = false
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
