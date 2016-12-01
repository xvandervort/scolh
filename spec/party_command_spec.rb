require 'spec_helper'

describe Scolh::PartyCommand do
  context 'basic functionality' do
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
    
    it "should include address in english response when it exists" do
      addy = "abcdef123456789"
      str = "#{ @name } has payment address #{ addy }"
      p2 = Scolh::PartyCommand.new "party #{ str }"
      expect(p2.to_s).to eq(str)
    end
  end
  
  context 'self check' do
    it "should know when no payment address found" do
      party = Scolh::PartyCommand.new "party phil"
      expect(party.self_check).to eq(false)
      expect(party.errors).to include('needs payment address')
    end
    
    # For demo purposes, anyhting with 27 to 40 characters,
    # all within 0-9A-F is counted as good. Obviously
    # if this were a production system, that would have to be
    # overridden by something targeted to the actual blockchain
    it "should know when bad payment address found" do
      party = Scolh::PartyCommand.new "party phil has payment address 4"
      expect(party.self_check).to eq(false)
      expect(party.errors).to include('has an invalid payment address')
    end
    
    it "should know when good payment address found" do
       party = Scolh::PartyCommand.new "party phil has payment address 10a34d0030f55a32abb3ee60101b2"
       expect(party.self_check).to eq(true)
    end
    
    # TODO: look for coin spec file and apply accordingly
    it "should accept 'dummy' as a payment address" do
      party = Scolh::PartyCommand.new "party phil has payment address dummy"
      expect(party.self_check).to eq(true)
    end
  end
end