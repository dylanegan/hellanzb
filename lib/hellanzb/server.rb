module Hellanzb
  class Server
    attr_reader :queue

    def initialize(url)
      @connection = XMLRPC::Client.new2(url)
      @queue = Hellanzb::Queue.new(call('list'), self)
    end

    def cancel!
      call('cancel')
    end

    def clear!(all = true)
      call('clear', all)
      @queue.update!
    end

    def connected?
      !@connection.nil?
    end

    def continue!
      call('continue')
    end

    def currently_downloading
      call('status')['currently_downloading']
    end

    def downloading?
      call('status')['currently_downloading'].any?
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
