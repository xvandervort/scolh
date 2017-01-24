require 'spec_helper'

describe Scolh::TermList do
  before do
    @pc1 = Scolh::PartyCommand.new "party joe has payment address 1FfmbHfnpaZjK4vyi1okTjHHvtN455paPH"
    @pc2 = Scolh::PartyCommand.new "party jim has payment address 1FnpaZjKfmbHf4vyjHHvi1okTtpaPHN455"
    @pay1 = Scolh::PaymentCommand.new  "pay $35 from joe to jim on 3/21/2099"
    @tl = Scolh::TermList.new
  end

  it "holds terms in a list" do
    expect(@tl.list).to be_kind_of(Array)
    @tl << @pc1
    expect(@tl.list.size).to eq(1)
  end

  it "finds terms by type" do
    @tl << @pc1 << @pay1
    results = @tl.find type: 'payment'
    expect(results).to eq([@pay1])
  end

  it "finds terms by type and value" do
    @tl << @pc1 << @pay1 << @pc2
    results = @tl.find type: 'party', name: 'jim'
    expect(results).to eq([@pc2])
  end
end
