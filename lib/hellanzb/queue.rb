module Hellanzb
  class Queue
    attr_reader :items
    def initialize(queue, server)
      @server = server
      parse_queue(queue)
    end

    def clear!
      @server.clear!(false)
      update!
    end

    def dequeue!(id)
      @server.call('dequeue', id)
      update!
    end

    def enqueue(file)
      @server.call('enqueue', file)
    end

    def update!
      parse_queue(@server.call('list'))
    end

  private
    def parse_queue(queue)
      @items = queue.inject([]) do |array, nzb|
        array << Hellanzb::Nzb.new(nzb['id'], nzb['nzbName'], nzb['is_par_recovery'], self)
        array
      end
    end
  end
end
