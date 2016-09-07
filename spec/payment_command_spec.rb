require 'spec_helper'

describe Scolh::PaymentCommand do
  it "should init with english" do
    amount = 35
    payer = 'joe'
    payee = 'jim'
    date = '3/11/2919'
    # Should the word "pay" be changed to "transfer?"
    command_string = "pay $#{ amount } from #{ payer } to #{ payee } on #{ date }"
    pay = Scolh::PaymentCommand.new command_string
    expect(pay.amount).to eq(amount)
    expect(pay.payer).to eq(payer)
    expect(pay.payee).to eq(payee)
    expect(pay.date).to eq(date)
  end
end