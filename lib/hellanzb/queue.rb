module Hellanzb
  class Queue
    attr_reader :items

    def initialize(queue, server)
      @items = queue
      @server = server
    end
  end
end
