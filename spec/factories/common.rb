FactoryGirl.define do
  factory :user, :class=>'User' do |f|
    sequence(:username) { |i| "test_#{i}" }
    sequence(:email) { |i| "test_#{i}@galdomedia.com" }
    password "testtest"
    password_confirmation "testtest"
  end
  
  factory :menu_group, :class=>"MenuGroup" do |f|
    sequence(:name) { |i| "test #{i}" }
    sequence(:identifier) { |i| "test_#{i}" }
  end

  factory :site, :class=>"Site" do |f|
    sequence(:name) { |i| "test #{i}" }
    lang_code "pl"
  end

  factory :domain, :class=>"Domain" do |f|
    sequence(:domain) { |i| "host_#{i}.test" }
    site
  end

  factory :room, :class=>"Room" do
    sequence(:name) { |n| "test #{n}"}
  end

  factory :resource, :class=>"Resource" do
    sequence(:name) { |n| "test #{n}" }
    quantity 1
  end

  factory :page, :class=>"Page" do
    sequence(:name) { |n| "page #{n}" }
    site
  end
end
