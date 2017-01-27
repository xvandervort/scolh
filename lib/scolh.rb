require "scolh/version"
require 'highline'
require 'highline/import'
require 'scolh/runner'

module Scolh
  def run
    runner = Runner.new
    hl = HighLine.new
    command = ""
    until command == "quit" do
      command = hl.ask "#{ runner.counter }? "

      # execution block here
      begin
        out = runner.execute command
        say out if out

      rescue Exception => e
        puts e
      end
    end
  end
end
