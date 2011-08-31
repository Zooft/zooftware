require 'spec_helper'

describe PromotedItem do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:promoted_group_id) }
  it { should validate_presence_of(:site_id) }
end
