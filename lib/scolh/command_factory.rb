require_relative 'party_command'

module Scolh
  class CommandFactory
    def initialize
    end
    
    def parse(command)
      if command =~ /^party/
        PartyCommand.new command
        
      else
        # This may be a pass-through thing - treat as simple text.
        
      end
    end
  end
end