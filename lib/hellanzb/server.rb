module Hellanzb
  class Server
    attr_reader :queue

    def initialize(url)
      @connection = XMLRPC::Client.new2(url)
      @queue = Hellanzb::Queue.new(call('list'), self)
    end

    def call(command, *args)
      @connection.call(command, *args)
    end
  end
end
