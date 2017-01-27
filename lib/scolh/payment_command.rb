module Scolh
  class PaymentCommand
    attr :amount, :payer, :payee, :date
    
    # in: line is the actual command line.
    #      defaulting for now to an English style format
    # TODO: validate that all terms are present and in usable format.
    # TODO: Accept non-integer payment amounts!
    # TODO: Accept currencies other than USD
    def initialize(line)
      # step 1: extract params
      line =~ /^pay\s+\$*(\d+)\s+from\s+(.*?)\s+to\s+(.*?)\s+on\s+(.*)/i
      @amount = $1.to_i
      @payer  = $2
      @payee  = $3
      @date   = $4  # TODO= Parse the date into a date object
    end
    
    def to_s
      payer_add = payer_address
      str = "pay $#{ @amount } from #{ payer_name }"
      str += " using address #{ payer_add }" if payer_add

      payee_add = payee_address
      str += " to #{ payee_name }"
      str += " at address #{ payee_add }" if payee_add
      str += " on #{ @date }"
      str
    end

    # IN: A party object and a type, either payer or payee
    def add_party(party, which_party)
      case which_party
      when 'payer'
        @payer_party = party

      when 'payee'
        @payee_party = party

      else
        # TODO: Return an error
      end
    end

    # Prefer the party object data so updates are easier
    # TODO: DRY THESE payer/payee methods up!
    def payer_name
      if @payer_party
        @payer_party.name
      else
        @payer
      end
    end

    def payer_address
      if @payer_party && @payer_party.payment_address
        @payer_party.payment_address
      end
    end

    def payee_name
      if @payee_party
        @payee_party.name
      else
        @payee
      end
    end

    def payee_address
      if @payee_party && @payee_party.payment_address
        @payee_party.payment_address
      end
    end

    # IN: A party object
    # it checks the name of the party against the names
    # of payer and payee and inserts if it finds a match
    def add_if_match(party)
      add_to = if party.name == @payer
        'payer'
      elsif party.name == @payee
        'payee'
      end

      add_party(party, add_to) if add_to
    end
  end
end