require 'spec_helper'

describe Scolh::Runner do
  before do 
    @r = Scolh::Runner.new
  end

  describe "init" do
    it "should initialize commands" do
      expect(@r.commands).to be_kind_of(Array)
      expect(@r.commands).to be_empty
    end

    it "should initialize command factory" do
      expect(@r.comfact).to be_kind_of(Scolh::CommandFactory)
    end

    it "should initialize counter" do
      expect(@r.counter).to eq(1)
    end

    it "should initialize terms list" do
      expect(@r.terms).to be_kind_of(Scolh::TermList)
    end
  end

  describe "commands" do


  end
end