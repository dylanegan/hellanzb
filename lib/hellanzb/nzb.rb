module Hellanzb
  class Nzb
    attr_reader :id, :name

    def initialize(id, name, par_recovery, server)
      @id = id
      @name = name
      @par_recovery = par_recovery
      @server = server
    end

    def par_recovery?
      @par_recovery
    end

    def dequeue!
      @server.call('dequeue', @id)
    end

    def down(spaces = 1)
      @server.call('down', @id, spaces)
    end

    def force!
      @server.call('force', @id)
    end

    def last!
      @server.call('last', @id)
    end

    def position=(index)
      @server.call('move', @id, index)
    end

    def next!
      @server.call('next', @id)
    end

    def rarpass=(pass)
      @server.call('setrarpass', @id, pass)
    end

    def up(spaces = 1)
      @server.call('up', @id, spaces)
    end
  end
end
