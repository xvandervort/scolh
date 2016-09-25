module Scolh
  # output is the class that generates the actual code for the contract
  # In production, it probably just fills in the blanks in some templates
  # but in this PoC system, it just prints out some stubs.
  # Done as a class because it needs switches to control behavior
  class OutputCommand
    attr_reader :dummy
    
    def initialize(command_line = "")
      switches = parse(command_line)
      @dummy = (switches[:dummy] == true)
    end
    
    # turn supplied terms list into a contract
    def run(terms = [])
      "This is pretend contract code"
    end
    
    private
    
    def parse(line)
      # Print is the user friendly alias for output.
      # 'output' is not revealed to users.
      l = line.sub("print", "").strip
      params = {}
      unless l.empty?
        parts = l.split(/=/).map{|x| x.strip}
        parts.each_slice(2) do |key, value|
          # do not use EVAL to find true or false values, because it's dangerous
          value = translate_parameter(value)
          params[key.to_sym] = value
        end
      end      
      params
    end
    
    def translate_parameter(v)
      case v.downcase
      when 'true'
        true
        
      when 'false'
        false
        
      else
        # todo: look for numbers and parameter codes (not yet defined)
        value
      end
    end
  end
end