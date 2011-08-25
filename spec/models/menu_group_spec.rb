require 'spec_helper'

describe MenuGroup do
  before(:each) do
    @menu_group = Factory.create(:menu_group)
  end
  it { should have_many(:menu_items) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:identifier) }
  it { should validate_uniqueness_of(:identifier) }

  context "proper behavious of default" do
    it "should be marked as default, if this is first menu group" do
      @menu_group.is_default.should == true
    end

    it "should not be marked as default, if it's second menu group" do
      mg = Factory.create(:menu_group)
      mg.is_default.should == false
    end

    it "should mark first menu group as not default, if second is marked as default" do
      mg = Factory.create(:menu_group)
      mg.is_default = true
      mg.save
      @menu_group.reload
      @menu_group.is_default.should == false
      mg.reload
      mg.is_default.should == true
    end

  end
end
