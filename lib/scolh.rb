require "scolh/version"
require 'highline'
require 'scolh/command_factory'
require 'scolh/party_command'
require 'scolh/payment'

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
        out = cf.parse command
        
        # special handling goes here.
        # for example, quit, list terms, or setting variables (not yet implemented!)
        terms << out
        
      rescue e
        puts e
      end
      
      # then go on to the next line (unless there was an error)
      line_number += 1
    end
  end
end
