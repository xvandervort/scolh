require 'spec_helper'

describe Scolh::PartyCommand do
  it "should extract the name from the command" do
    name = "Buddy Blank"
    p = Scolh::PartyCommand.new "party #{ name }"
    expect(p.name).to eq(name)
  end
end