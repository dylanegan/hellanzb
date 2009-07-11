module Hellanzb
  class Nzb
    attr_reader :id, :name

    def initialize(id, name, par_recovery, queue)
      @id = id
      @name = name
      @par_recovery = par_recovery
      @queue = queue
    end

    def par_recovery?
      @par_recovery
    end
  end
end
