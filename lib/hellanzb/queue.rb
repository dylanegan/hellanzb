module Hellanzb
  class Queue
    attr_reader :items
    def initialize(queue, client)
      @client = client
      parse_queue(queue)
    end

    def clear
      @client.clear(false)
      update
    end

    def dequeue(id)
      @client.call('dequeue', id)
      update
    end

    def down(id)
      @client.call('down', id)
      update
    end

    def empty?
      @items.empty?
    end

    def enqueue(file)
      @client.call('enqueue', file)
    end

    def force(id)
      @client.call('force', id)
      update
    end

    def last(id)
      @client.call('last', id)
      update
    end

    def move(id, index)
      @client.call('move', id, index)
      update
    end

    def next(id)
      @client.call('next', id)
      update
    end

    def position_for(id)
      @items.each_with_index do |nzb, index|
        if nzb.id == id
          @position = index + 1
        end
      end
      @position
    end

    def rarpass(id, pass)
      @client.call('setrarpass', id, pass)
    end

    def up(id)
      @client.call('up', id)
      update
    end

    def update
      parse_queue(@client.call('list'))
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
