require 'spec_helper'

describe Scolh::TermList do
  before do
    @pc1 = Scolh::PartyCommand.new "party joe has payment address 1FfmbHfnpaZjK4vyi1okTjHHvtN455paPH"
    @pc2 = Scolh::PartyCommand.new "party harcourt has payment address 1FnpaZjKfmbHf4vyjHHvi1okTtpaPHN455"
    @tl = Scolh::TermList.new
  end

  it "holds terms in a list" do
    expect(@tl.list).to be_kind_of(Array)
    @tl << @pc1
    expect(@tl.list.size).to eq(1)
  end
end
