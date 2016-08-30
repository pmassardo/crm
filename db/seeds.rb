# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


AccountType.destroy_all
AccountType.create(name: 'Lead')
AccountType.create(name: 'Account')
AccountType.create(name: 'In-Active') # used instead of delete

AppointmentType.destroy_all
AppointmentType.create(name: 'Phone')
AppointmentType.create(name: 'In-Person')
