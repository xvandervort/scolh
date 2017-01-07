require 'erb'

module Scolh
  # output is the class that generates the actual code for the contract
  class OutputCommand
    attr_reader :dummy
    
    def initialize(command_line = "")
      switches = parse(command_line)
      @dummy = (switches[:dummy] == true)
      @counters ={}
    end
    
    # turn supplied terms list into a contract
    def run(terms = [], language = 'js')
      code = []
      terms.each do |term|
        code << generate(language, term)
      end
      
      code.join("\n\n")
    end

    # lang refers to the programming languge. 
    # Currently only javascript (js) is supported.
    # cls is the class to be used
    def generate(lang, obj)
      obj.class.name =~ /Scolh::(.*)Command/
      classname = $1.downcase
      increment_counter(classname)

      # TODO: add in error handling for unknown command types
      template = File.open(template_path(lang, classname), "r").read
      r = ERB.new template
      r.result binding
    end

    def template_path(lang, cl)
      # note how "lang" is used for both the folder and the extension
      "#{File.dirname(__FILE__)}/templates/#{lang}/#{cl}.erb.#{lang}"
    end
    
    private

    # counters make sure variable name clashes are avoided during generation
    def increment_counter(key)
      if @counters.key?(key)
        @counters[key] += 1
      else
        @counters[key] = 1
      end
    end
    
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