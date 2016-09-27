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
      
      # checks for parties.
      parties = terms.collect{|x| x if x.class.name == "Scolh::PartyCommand"}.compact
      # check number 1: Are there at least 2 parties in the transaction?
      count_parties(parties)
      
      # check number 2 looks for payment addresses in the parties
      check_payment_addresses(parties)
      # end party checks
      
      (@errors.size == 0)
    end
    
    private
    
    # in: Terms list
    # out: true if there are at least 2 parties to this contract
    #      false, otherwise
    def count_parties(parties)
      s = parties.size

      if s == 0
        @errors << "No parties given"
        
      elsif s == 1
        @errors << "Only one party given"
        
      else
        # no error.
      end
      
      (s > 1)      
    end
    
    # runs self check on each party for valid info
    def check_payment_addresses(parties)
      out = []
      parties.each do |party|
        res = party.self_check
        party.errors.map{|err| @errors << "Party #{ party.name } #{ err }"} unless res == true
        out << res
      end
      
      out.include?(false)
    end
  end
end