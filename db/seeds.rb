# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name: 'admin',first_name: 'Admin', last_name: 'Admin', password: '123', password_confirmation: '123',
             email: 'admin@admin.com', admin: true, role: 'Admin')
