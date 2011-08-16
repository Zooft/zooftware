require 'spec_helper'

describe Domain do
  before(:each) do
    @site = Factory.create(:site)
    @domain = Factory.create(:domain, :site=>@site)
  end
  it { should belong_to(:site) }
  it { should validate_presence_of(:domain) }
  it { should validate_presence_of(:site_id) }
  it { should validate_uniqueness_of(:domain) }

  context "[is primary]" do
    it "should mark first domain as primary" do
      @domain.reload
      @domain.is_primary.should == true
      s = Factory.create(:site)
      d = Factory.create(:domain, :site=>s)
      d.reload
      d.is_primary.should == true
    end

    it "should not mark new domain as primary, if not asked to" do
      d = Factory.create(:domain, :site=>@site)
      d.reload
      d.is_primary.should_not == true
      @domain.is_primary.should == true
    end
  
    it "should be marked as primary, when asked to (and there should be only one primary" do
      @domain.is_primary.should == true
      d = Factory.create(:domain, :site=>@site)
      d.is_primary =true
      d.save!
      d.reload
      d.is_primary.should == true
      @domain.reload
      @domain.is_primary.should == false
    end

  end
end
