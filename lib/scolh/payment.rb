module Scolh
  class Payment
    attr :amount, :payor, :payee, :date
    def initialize(params = {})
      @amount = params[:amount]
      @payor = params[:payor]
      @payee = params[:payee]
      @date = params[:date]
      
      # TODO: validate that all terms are present and in usable format.
    end
  end
end