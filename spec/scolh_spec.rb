require 'spec_helper'

describe Scolh do
  it 'has a version number' do
    expect(Scolh::VERSION).not_to be nil
  end

  it 'adds addresses of known parties to payment command' do
      # question: What happens if the address changes later? 
      # We don't want to add just an address field but a LINK
      # to the actual user. How do we do that??

  end
end
