# This file should contain all the record creation needed to seed the database with its default values.
# The data can then ser loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs
#20.times do
  #Events.create do |event|
  #event.description = Faker::Marketing.buzzwords
  #event.place = Faker::Company.name

  #end
40.times do
    User.create do |user|
    user.name = Faker::Name.name
    user.admin = false
    user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
    end
  end
  20.times do
    User.create do|user|
    user.name = Faker::Name.name
    user.admin = true
    user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
    end
  end
5.times do
  Organization.create do |organization|

    organization.description = Faker::IndustrySegments.sector
    organization.place = Faker::Address.unique.community
    organization.name = Faker::Company.unique.name
  end
end

60.times do
  Password.create do |password|
    password.user_id = User.all.sample.id
    password.psw =  Faker::String.random(length: 6)
    password.active = true
  end
end

20.times do
  Event.create! do |event|
    event.description = Faker::String.random
    event.place = Faker::WorldCup.stadium
    event.user_id = User.all.sample.id
    event.public = [true,false].sample
    event.is_org = [true,false].sample
    event.organization_id = Organization.all.sample.id

  end
end
60.times do
  HourProposal.create do |hour_proposal|
    hour_proposal.event_id = Event.all.sample.id
    hour_proposal.user_id = User.all.sample.id
    hour_proposal.vote = Faker::Date.in_date_period
    hour_proposal.is_voter_creator = [true,false].sample


  end
end





