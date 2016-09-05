require 'spec_helper'

describe Scolh::CommandFactory do
  it "should know party command" do
    c = Scolh::CommandFactory.new
    comm = c.parse "party Charlie McCarthy"
    expect(comm).to be_kind_of(Scolh::PartyCommand)
  end
  
end