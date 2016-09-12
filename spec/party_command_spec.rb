require 'spec_helper'

describe Scolh::PartyCommand do
  before do
    @name = "Buddy Blank"
    @p = Scolh::PartyCommand.new "party #{ @name }"
  end
  
  it "should extract the name from the command" do
    expect(@p.name).to eq(@name)
  end
  
  it "should give english response to to_s" do
    expect(@p.to_s).to eq(@name)
  end
  
  it "should accept payment address at init" do
    addy = "abcdef123456789"
    p2 = Scolh::PartyCommand.new "party #{ @name } has payment address #{ addy }"
    expect(p2.payment_address).to eq(addy)
  end
end