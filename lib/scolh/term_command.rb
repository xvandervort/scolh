require 'date'

module Scolh
  # extracts the times of begin and end events for the contract
  # (Actually, currently just the begin date)
  class TermCommand
    attr_reader :start_date
    # not yet implemented :start_time, :end_date, :end_time, :start_event, :end_event
    # :end_event is especially important because many contracts can be temrinated by one or both parties
    # so a notice of termination would be an important thing to respond to.

    def initialize(command_line)
      parse(command_line)
    end
    
    def to_s
      if @start_date.nil?
        "Undefined term"
      else
        "In force from #{ @start_date.month }/#{ @start_date.day }/#{ @start_date.year }"
      end
    end
    
    private
    
    def parse(line)
      l = line.sub("term", "").strip 
      # now look for the start clause
      # because nothing else is implemented, just go to the end of the line from there
      # When other things are implemented a more precise syntax will be required.
      l =~ /start\s+(.*)/
      d = $1 # || throw an error if nothing found.
      
      # note that we're making no attempt to figure out the format used.
      # it should just be a standard American style date with 4 digit year.
      @start_date = Date.strptime d, "%m/%d/%Y"
    end
  end
end