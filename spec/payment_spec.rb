require 'spec_helper'

describe Scolh::Payment do
  it "should init with amount" do
    pay = Scolh::Payment.new amount: 35
    expect(pay.amount).to eq(35)
  end
  
  it "should init with payor" do
    pay = Scolh::Payment.new payor: 'joe'
    expect(pay.payor).to eq('joe')
  end
  
  it "should init with payee" do
    pay = Scolh::Payment.new payee: 'jim'
    expect(pay.payee).to eq('jim')
  end
  
  it "should init with date" do
    date = Date.today
    pay = Scolh::Payment.new date: date
    expect(pay.date).to eq(date)
  end
end