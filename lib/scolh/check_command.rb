module Scolh
  # given a list of contract terms
  # check validates that they are consistent and correct enough to encode.
  # TODO: Adapt to use dynamic rulesets
  # for now, just using a few reasonable defaults to demonstrate
  class CheckCommand
    attr_reader :errors
    # set switches here
    # For example there might be a switch to skip a particular check,
    # or to do it in a more strict or loose way.
    def initialize
    end
    
    def run(terms = [])
      @errors = []
      
      # check number 1: Are there at least 2 parties in the transaction?
      count_parties(terms)
      
      (@errors.size == 0)
    end
    
    private
    
    # in: Terms list
    # out: true if there are at least 2 parties to this contract
    #      false, otherwise
    def count_parties(t)
      s = t.collect{|x| x.class.name == "Scolh::PartyCommand"}.size

      if s == 0
        @errors << "No parties given"
        
      elsif s == 1
        @errors << "Only one party given"
        
      else
        # no error.
      end
      
      (s > 1)      
    end
  end
end