require 'spec_helper'

describe Scolh::CheckCommand do
  before do
    @c = Scolh::CommandFactory.new
    @ch = Scolh::CheckCommand.new
  end
  
  it "should error when only one party" do
    list = [@c.parse("party joe has payment address 00100101")]
    expect(@ch.run(list)).to eq(false)
    expect(@ch.errors).to include("Only one party given")
  end
end