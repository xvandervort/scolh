module Scolh
  # extracts the names of parties involved.
  # maybe later it will also be attached to their responsibilities
  # OR even have a hierarchy
  class PartyCommand
    attr_reader :name, :payment_address
    
    def initialize(command_line)
      @name, @payment_address = parse(command_line)
    end
    
    # eventually this will include address and stuff
    def to_s
      @name
    end
    
    def update
      #not yet implemented
    end
    
    private
    
    def parse(line)
      # are there switches or subcommands that would go with this?
      # It's going to outgrow this method of finding params soon!
      l = line.sub("party", "").strip
      parts = l.split(/has/)
      name = parts.shift.strip

      unless parts.empty?
        parts.first =~ /\s*payment\s+address\s+(.*)/
        
        # TODO: Verify that payment address is valid.
        # BUT since format changes depending on blockchain used,
        # this should be managed by configurable plugin modules.
        payment_address = $1
      end
      
      [name, payment_address]
    end
  end
end