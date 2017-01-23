module Scolh
  # keeps track of contract terms
  # usually used as if a singleton, though
  # it doesn't have to be!
  class TermList
    attr_reader :list

    def initialize
      @list = []
    end

    # In: A contract term command object
    # To be stored or updatde in the list
    def <<(item)
      @list << item

    end
  end
end
