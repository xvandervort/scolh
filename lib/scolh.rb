require "scolh/version"
require 'highline'
require 'scolh/command_factory'
require 'scolh/party_command'

module Scolh
  def run
    command = ""
    line_number = 1
    terms = []
    hl = HighLine.new
    until command == "quit" do
      command = hl.ask "#{ line_number }? "
      
      # execution block here
      
      # then go on to the next line (unless there was an error)
      line_number += 1
    end
  end
end
