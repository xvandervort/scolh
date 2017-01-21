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

    it "should know where to find party javascript template" do
      f = @o.template_path(:js, :party)
      expect(f).to be_kind_of(String)
    end

    it "should return party js" do
      party1 = @list.first
      js = @o.generate('js', party1)
      expect(js).to eq(party_js(party1))
    end

    it "should return payment js" do
      payment1 = @list[2]
      js = @o.generate('js', payment1)
      expect(js).to eq(payment_js(payment1))
    end

    it "should return code for the whole list" do
      js = @o.run @list, 'js'
      target = party_js(@list.first) + "\n\n" +
               party_js(@list[1], 2) + "\n\n" +
               payment_js(@list.last)

      expect(js).to eq(target)
    end
  end

  # This solution only works for very simple code.
  # Note: Tried the ~ Heredoc syntax and the whole thing blew up!
  def party_js(party, count = 1)
    "var party#{count} = {\n" +
    "  name: '#{party.name}',\n" +
    "  payment_address: '#{party.payment_address}'\n" +
    "}"
  end

  def payment_js(payment, count = 1) 
    "var payment#{count} = {\n" +
    "  payer: '#{payment.payer}',\n" +
    "  payee: '#{payment.payee}',\n" +
    "  amount: '#{payment.amount}',\n" +
    "  trigger_type: 'Date',\n" +
    "  trigger_detail: '#{payment.date}'\n" +
    "}"
  end
end