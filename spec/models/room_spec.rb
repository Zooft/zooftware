require 'spec_helper'

describe Room do
  before(:each) do
    Factory.create(:room)
  end
  it { should have_many(:resources) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
