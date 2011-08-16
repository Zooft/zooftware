require 'spec_helper'

describe Site do
  it { should have_many(:domains) }
  # it { should have_many(:menu_items) }
  # it { should have_many(:pages) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:lang_code) }

  it "should have primary domain" do
    s = Factory.create(:site)
    d = Factory.create(:domain, :site=>s)
    s.primary_domain.should == d
  end
end
