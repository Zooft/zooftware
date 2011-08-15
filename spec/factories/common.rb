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
end
