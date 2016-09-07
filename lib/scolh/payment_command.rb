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
  end
end