require "scolh/version"
require 'highline'
require 'highline/import'
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
          # TODO: Extract special handling from this location
          #       Maybe a handling method on the same class?
          if out.class.name == 'Scolh::OutputCommand'
            say out.run(terms)
            
          elsif out.class.name == 'Scolh::CheckCommand'
            if out.run terms
              say "<%= color('This contract passes validation.', :green) %>"
            
            else
              say "<%= color('This contract fails validation with these errors:', :red) %>"
              out.errors.map{|x| puts "\t#{ x }"}
            end
          else
            terms << out
            line_number += 1
          end
        end
        
      rescue Exception => e 
        puts e
      end
    end
  end
end
