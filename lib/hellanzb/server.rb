module Hellanzb
  class Server
    def initialize(url)
      @connection = XMLRPC::Client.new2(url)
    end

    def call(command, *args)
      @connection.call(command, *args)
    end
  end
end
