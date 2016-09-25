require "scolh/version"
require 'highline'
require 'scolh/command_factory'

module Scolh
  def run
    command = ""
    line_number = 1
    terms = []
    cf = CommandFactory.new
    hl = HighLine.new
    until command == "quit" do
      command = hl.ask "#{ line_number }? "
      
      # execution block here
      begin
        if command == "list" || command == "l"
          terms.map{|t| puts t }
          
        else        
          out = cf.parse command
          
          # special handling goes here.
          # for example setting variables (not yet implemented!)
          if out.class.name == 'Scolh::OutputCommand'
            puts out.run(terms)
            
          else
            terms << out
            line_number += 1
          end
        end
        
      rescue e
        puts e
      end
    end
  end
end
