require 'spec_helper'
require 'active_support'
require 'active_support/core_ext/numeric/time'

describe Scolh::TermCommand do
  context "start date" do
    it "should set date from command line" do
      date = Date.today + 3.days
      line = "term start #{date.month}/#{date.day}/#{date.year}"
      term = Scolh::TermCommand.new line
      expect(term.start_date).to eq(date)
    end
    
    it "should say its start date" do
      date = Date.today + 3.days
      string_date = "#{date.month}/#{date.day}/#{date.year}"
      line = "term start #{ string_date }"
      term = Scolh::TermCommand.new line
      expect(term.to_s).to eq("In force from #{ string_date }")
    end
  end
end
