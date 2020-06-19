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
10.times do
  User.create do |user|
    user.name = Faker::Name.name
    user.admin = false
    user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
    user.location= Faker::Address.city
    user.bio= Faker::Lorem.paragraph(sentence_count: 3)
  end
end
5.times do
  User.create do|user|
    user.name = Faker::Name.name
    user.admin = true
    user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
    user.location= Faker::Address.city
    user.bio= Faker::Lorem.paragraph(sentence_count: 3)
  end
end

5.times do
  Organization.create do |organization|
    organization.description = Faker::IndustrySegments.sector
    organization.place = Faker::Address.unique.community
    organization.name = Faker::Company.unique.name
  end
end

15.times do
  Password.create do |password|
    password.user_id = User.all.sample.id
    password.psw =  Faker::Internet.password
    password.active = true
  end
end
10.times do
  OrganizationUser.create do |organization_user|
    organization_user.organization_id = Organization.all.sample.id
    organization_user.user_id = User.all.sample.id
    organization_user.active = [true,false].sample
  end
end
4.times do
  Event.create! do |event|
    event.description = Faker::Book.title
    event.place = Faker::WorldCup.stadium
    event.user_id = User.all.sample.id
    event.public = [true,false].sample
    event.is_org = [true,false].sample
    event.organization_id = Organization.all.sample.id

  end
end
16.times do
  HourProposal.create do |hour_proposal|
    hour_proposal.event_id = Event.all.sample.id
    hour_proposal.user_id = User.all.sample.id
    hour_proposal.vote = Faker::Date.in_date_period
    hour_proposal.is_voter_creator = [true,false].sample
  end
end

20.times do
  EventChat.create do |event_chat|
    event_chat.event_id = Event.all.sample.id
    event_chat.user_id = User.all.sample.id
    event_chat.content = Faker::Lorem.paragraph(sentence_count: 2)
  end
end
30.times do
  Comment.create do |comment|
    comment.user_id = User.all.sample.id
    comment.event_id = Event.all.sample.id
    comment.content = Faker::Lorem.paragraph(sentence_count: 2)
  end
end
20.times do
  Invite.create do |invite|
    invite.event_id = Event.all.sample.id
    invite.sender_id = User.all.sample.id
    invite.target_id = User.all.sample.id
    invite.title = Faker::Company.name
    invite.status = [true,false].sample

  end
end
20.times do
  Message.create do |message|
    message.target_id = User.all.sample.id
    message.sender_id = User.all.sample.id
    message.content = Faker::Lorem.paragraph(sentence_count: 2)
    message.seen = [true,false].sample

  end
end




