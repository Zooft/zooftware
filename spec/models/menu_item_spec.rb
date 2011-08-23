require 'spec_helper'

describe MenuItem do
  before(:each) do
    @menu_group = Factory.create(:menu_group)
    @menu_item = Factory.create(:menu_item)
  end
  it { should belong_to(:page) }
  it { should belong_to(:menu_group) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).scoped_to(:menu_group_id) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:page_id) }
  it { should validate_presence_of(:menu_group_id) }

  context "[validation]" do
    it "should validate page conditionally" do
      m = Factory.build(:menu_item, :menu_group=>@menu_group)
      m.page = Factory.create(:page)
      m.url = nil
      m.should be_valid
    end
    it "should validate url conditionally" do
      m = Factory.build(:menu_item, :menu_group=>@menu_group)
      m.page = nil
      m.url = "/"
      m.should be_valid
    end
  end
end
