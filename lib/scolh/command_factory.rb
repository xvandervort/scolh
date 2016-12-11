require_relative 'party_command'
require_relative 'payment_command'
require_relative 'output_command'
require_relative 'check_command'
require_relative 'term_command'

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
        
      elsif command =~ /^check/
        CheckCommand.new # TODO: parse switches
        
      elsif command =~ /^term/
        TermCommand.new command
      
      else
        # This may be a pass-through thing - treat input as simple text
        # rather than an error. Unless we make a "text" command?
        
      end
    end
  end
end