require 'spec_helper'

describe Page do
  it { should belong_to(:site) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:site_id) }
end
