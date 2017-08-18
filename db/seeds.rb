# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
# User.create(name: "사자", email: "abc@abc.com", password => 'asdfgh', password_confirmation => 'asdfgh')
# User.create(name: "으른", email: "aaa@aaa.com", password => 'bbbb', password_confirmation => 'bbbb')

Pic.create(studentID: 5, certiDate: Date.today)
Pic.create(studentID: 5, certiDate: Date.today-3)