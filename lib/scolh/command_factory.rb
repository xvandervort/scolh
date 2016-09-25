require_relative 'party_command'
require_relative 'payment_command'
require_relative 'output_command'

module Scolh
  class CommandFactory
    def initialize
    end
    
    def parse(command)
      if command =~ /^party/
        PartyCommand.new command
        
      elsif command =~ /^pay/
        PaymentCommand.new command
        
      elsif command =~ /^print/
        OutputCommand.new command
      
      else
        # This may be a pass-through thing - treat input as simple text
        # rather than an error. Unless we make a "text" command?
        
      end
    end
  end
end