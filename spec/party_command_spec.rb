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
end