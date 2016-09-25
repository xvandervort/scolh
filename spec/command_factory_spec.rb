require 'spec_helper'

describe Scolh::CommandFactory do
  
  before do
    @c = Scolh::CommandFactory.new
  end
  
  it "should know party command" do
    comm = @c.parse "party Charlie McCarthy"
    expect(comm).to be_kind_of(Scolh::PartyCommand)
  end
  
  it "should know payment command" do
    # This is the plain english appproach
    # which we'll follow as standard for now.
    comm = @c.parse "pay $35 from joe to jim on 3/11/2999"
    expect(comm).to be_kind_of(Scolh::PaymentCommand)
  end
  
  it "should know output command" do
    # more intuitive than 'output' but may change in the future to something more flexible.
    comm = @c.parse "print"
    expect(comm).to be_kind_of(Scolh::OutputCommand)
  end
end