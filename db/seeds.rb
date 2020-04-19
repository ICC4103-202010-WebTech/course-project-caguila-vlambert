# This file should contain all the record creation needed to seed the database with its default values.
# The data can then ser loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs
20.times do
  Events.create do |event|
    event.description = Faker::Marketing.buzzwords
    event.place = Faker::Company.name

end
  40.times do
    User.create do |user|
    user.user_id = Faker::IDNumber.unique.chilean_id
    user.name = Faker::Name.name
    user.guest = true
    user.admin = false
    user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
    end
  end
  20.times do
    User.create do|user|
    user.user_id = Faker::IDNumber.unique.chilean_id
    user.name = Faker::Name.name
    user.guest = false
    user.admin = true
    user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
    end
  end
  5.times do
    Organization.create do |organization|
    organization.organization_id = Faker::Number.unique.within(range: 1..5)
    organization.description = Faker::IndustrySegments.sector
    organization.place = Faker::Address.unique.community
    organization.name = Faker::Company.unique.name
    end
  end
  60.times do
    Password.create do |password|
    password.psw_id = Faker::Number.unique.number(digits: 2)
    password.user_id = User.
    password.psw =  Faker::String.random(length: 6)
    password.active = true

    end
  end


  end


