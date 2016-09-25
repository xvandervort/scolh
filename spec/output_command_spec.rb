require 'spec_helper'

describe Scolh::OutputCommand do
  context "initialization" do
    it "should init without params" do
      o = Scolh::OutputCommand.new
      expect(o).to be_kind_of(Scolh::OutputCommand)
    end
    
    # dummy outputs code that can be verified but not run.
    # it does this by masking addresses.
    # Why? So there is an example of a switch, of course!
    it "should know 'dummy' param" do
      o = Scolh::OutputCommand.new "print dummy = true"
      expect(o.dummy).to eq(true)
    end
    
    it "should default dummy to false" do
      o = Scolh::OutputCommand.new
      expect(o.dummy).to eq(false)
    end
  end
  
  context "code output" do
    before do
      # build a simple list of commands.
      # The simplest possible contract is "party A pays amount X to party B immediately.
      # Oh! But "immediate payment" is not one of the options. So we'll put in today's date.
      c = Scolh::CommandFactory.new
      @list = []
      @list << c.parse("party A has payment address 01")
      @list << c.parse("party B has payment address 10")
      @list << c.parse("pay $1 from A to B on #{ Time.now.strftime("%m/%d/%Y") }")
      @o = Scolh::OutputCommand.new
    end
    
    # verify the code later
    it "should output text" do
      out = @o.run @list
      expect(out).to be_kind_of(String)
    end
  end
end