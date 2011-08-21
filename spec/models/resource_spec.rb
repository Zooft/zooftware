require 'spec_helper'

describe Resource do
  before(:each) do
    Factory.create(:resource) 
  end
  it { should belong_to(:room) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity) }
  it { should validate_uniqueness_of(:name) }
end
