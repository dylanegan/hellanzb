module Hellanzb
  class Nzb
    attr_reader :id, :name

    def initialize(id, name, par_recovery, queue)
      @id = id
      @name = name
      @par_recovery = par_recovery
      @queue = queue
    end

    def dequeue
      @queue.dequeue(@id)
    end

    def down
      @queue.down(@id)
    end

    def force
      @queue.force(@id)
    end

    def last
      @queue.last(@id)
    end

    def next
      @queue.next(@id)
    end

    def position
      @queue.position_for(@id)
    end

    def position=(index)
      @queue.move(@id, index)
    end

    def up
      @queue.up(@id)
    end

    def par_recovery?
      @par_recovery
    end
  end
end
