# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Site.first
  s = Site.new
  s.lang_code = 'pl'
  s.name = 'Zoo.pl'
  s.save
  if s.domains.empty?
    d = Domain.new
    d.site = s
    d.domain = 'zooftware.local'
    d.save
  end
end

unless User.admin.first
  u = User.new
  u.username = 'admin'
  u.email = 'admin@galdomedia.pl'
  u.password = 'test_test'
  u.password_confirmation = 'test_test'
  u.is_admin = true
  u.first_name = 'Zoo'
  u.last_name = 'Admin'
  u.accepts_regulation = true
  u.save!
  u.confirm!
end
