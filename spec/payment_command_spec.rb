require 'spec_helper'

describe Scolh::PaymentCommand do
  before do
    @amount = 35
    @payer = 'joe'
    @payee = 'jim'
    @date = '3/11/2919'
    # Should the word "pay" be changed to "transfer?"
    # and shouldn't ot be possible to switch the order of terms?
    #   ex: on DATE PAYER pay AMOUNT TO PAYEE
    @command_string = "pay $#{ @amount } from #{ @payer } to #{ @payee } on #{ @date }"
    @pay = Scolh::PaymentCommand.new @command_string
  end
  
  it "should init with english" do
    expect(@pay.amount).to eq(@amount)
    expect(@pay.payer).to eq(@payer)
    expect(@pay.payee).to eq(@payee)
    expect(@pay.date).to eq(@date)
  end
  
  it "should give its english version with to_s" do
    expect(@pay.to_s).to eq(@command_string)
  end
end