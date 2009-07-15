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

    def down!(id)
      @server.call('down', id)
      update!
    end

    def empty?
      @items.empty?
    end

    def enqueue(file)
      @server.call('enqueue', file)
    end

    def force!(id)
      @server.call('force', id)
      update!
    end

    def last!(id)
      @server.call('last', id)
      update!
    end

    def move!(id, index)
      @server.call('move', id, index)
      update!
    end

    def next!(id)
      @server.call('next', id)
      update!
    end

    def position_for(id)
      @items.each_with_index do |nzb, index|
        if nzb.id == id
          @position = index + 1
        end
      end
      @position
    end

    def up!(id)
      @server.call('up', id)
      update!
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
