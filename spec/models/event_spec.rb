require 'spec_helper'

describe Event do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:event_date) }
  it { should belong_to(:site) }
end
