require 'xmlrpc/client'

$:.unshift File.dirname(__FILE__)

%w( nzb queue status ).each { |lib| require lib }

module Hellanzb
  class Client
    attr_reader :queue

    def initialize(url)
      @connection = XMLRPC::Client.new2(url)
      @queue = Hellanzb::Queue.new(call('list'), self)
      @status = Hellanzb::Status.new(call('status'), self)
    end

    def cancel
      call('cancel')
    end

    def clear(all = true)
      call('clear', all)
      @queue.update
    end

    def continue
      call('continue')
    end

    def currently_downloading
      status.currently_downloading
    end

    def downloading?
      status.currently_downloading.any?
    end

    def processing?
      !status.is_paused
    end

    def pause
      call('pause')
    end

    def status
      @status.update
      @status
    end

    def call(command, *args)
      @connection.call(command, *args)
    end
  end
end
