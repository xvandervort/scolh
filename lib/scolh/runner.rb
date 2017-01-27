require 'scolh/command_factory'
require 'scolh/term_list'

module Scolh
  # given commands, it executes them.
  class Runner
    attr_reader :commands, :comfact, :counter, :terms

    def initialize
      @commands = []
      @comfact = CommandFactory.new
      @counter = 1
      @terms = TermList.new
    end

    def execute(command)
      @commands << command
      s = if command == "list" || command == "l"
        @terms.list.map{|t| puts t }

      else
        out = @comfact.parse command

        if out.class.name == 'Scolh::OutputCommand'
          out.run(@terms.list)

        elsif out.class.name == 'Scolh::CheckCommand'
          if out.run @terms.list
            "<%= color('This contract passes validation.', :green) %>"

          else
            str = "<%= color('This contract fails validation with these errors:', :red) %>"
            out.errors.map{|x| str += "\t#{ x }"}
            str
          end
        else
          @terms << out
          @counter += 1
          nil
        end
      end

      s
    end
  end
end