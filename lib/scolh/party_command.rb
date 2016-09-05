module Scolh
  # extracts the names of parties involved.
  # maybe later it will also be attached to their responsibilities
  # OR even have a hierarchy
  class PartyCommand
    attr_reader :name
    
    def initialize(command_line)
      # are there switches or subcommands that would go with this?
      # and how do we add address, phone number, etc? 
      @name = command_line.sub("party", "").strip
    end
  end
end