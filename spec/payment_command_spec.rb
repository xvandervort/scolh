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

  it "should use party object for payer when given" do
    part1 = Scolh::PartyCommand.new "party orville has payment address 4"
    @pay.add_party part1, 'payer'
    expect(@pay.payer_name).to eq(part1.name)
    expect(@pay.payer_address).to eq(part1.payment_address)
  end

  it "should use party data in string version" do
    part1 = Scolh::PartyCommand.new "party orville has payment address 4"
    part2 = Scolh::PartyCommand.new "party herkifer has payment address 7"
    @pay.add_party part1, 'payer'
    @pay.add_party part2, "payee"
    expect(@pay.to_s).to eq("pay $#{ @amount } from #{ part1.name } using address #{ part1.payment_address } to #{ part2.name } at address #{ part2.payment_address} on #{ @date }")
  end

  it "should add party that matches known name" do
    part1 = Scolh::PartyCommand.new "party joe has payment address 4"
    @pay.add_if_match part1

    # now update the party's name and watch the payment still find it!!
    part1.name = 'harcourt'
    expect(@pay.payer_name).to eq(part1.name)
  end
end