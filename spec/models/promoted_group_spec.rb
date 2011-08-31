require 'spec_helper'

describe PromotedGroup do
  before(:each) do
    @promoted_group = Factory.create(:promoted_group)
  end
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:identifier) }
  it { should validate_presence_of(:image_size) }
  it { should validate_uniqueness_of(:identifier) }
  it { should validate_format_of(:image_size).with('123x456#') }
end
