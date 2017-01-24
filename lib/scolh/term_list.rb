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

    # IN: a hash of search terms, one of which MUST be type
    def find(search)
      found = []
      if search.key?(:type)
        found = @list.select{|i| i.class.name =~ /#{search[:type]}/i}
        # There may be a secondary type or even more.
        keys = search.keys - [:type]
        keys.each do |key|
          found.select! do |i|
            i.respond_to?(key) && i.send(key) =~ /#{ search[key] }/i
          end
        end
      end

      found
    end

    def to_a
      @list
    end
  end
end
