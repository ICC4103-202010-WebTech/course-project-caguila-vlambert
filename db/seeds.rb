
i=0
15.times do
  i=i+1
  p=""
  user=User.new()
  user.name = Faker::Name.name
  user.admin = false
  user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
  user.location= Faker::Address.city
  user.bio= Faker::Lorem.paragraph(sentence_count: 3)
  user.email = Faker::Internet.email
  p=Faker::Internet.unique.password(min_length:6)
  user.password = p
  user.save
  password=Password.new()
  password.user_id = i
  password.psw = p
  password.active = true
  password.save
  email=Email.new()
  email.mail= user.email
  email.user_id = i
  email.active = true
  email.save
end
5.times do
  i=i+1
  p=""
  user=User.new()
   user.name = Faker::Name.name
   user.admin = true
   user.last =  Faker::Date.between(from: 1.year.ago, to: Date.today)
   user.location= Faker::Address.city
   user.bio= Faker::Lorem.paragraph(sentence_count: 3)
   user.email = Faker::Internet.email
  p=Faker::Internet.unique.password(min_length:6)
  user.password = p
  user.save
  password=Password.new()
  password.user_id = i
  password.psw = p
  password.active = true
  password.save
  email=Email.new()
  email.mail= user.email
  email.user_id = i
  email.active = true
  email.save
end
l=0
u=0
5.times do
  l=l+1
  org=Organization.new()
  org.description = Faker::IndustrySegments.sector
  org.place = Faker::Address.unique.community
  org.name = Faker::Company.unique.name
  org.save
  4.times do
    u=u+1
    orgus=OrganizationUser.new()
    orgus.organization_id=l
    orgus.user_id = u
    orgus.active = true
    orgus.save

  end
end
p=0
u=1
5.times do
  p=p+1
  event=Event.new()
  event.description =Faker::Book.title
  event.place = Faker::WorldCup.stadium
  event.public = [true,false].sample
  event.is_org = true
  event.organization_id = p
  event.user_id =u
  event.save
  u=u+4
end
e=0
u=1
i=1
5.times do
  e=e+1
  3.times do
    i=i+1
    invite=Invite.new()
    invite.event_id= e
    invite.sender_id=u
    invite.target_id=i
    invite.title = Faker::Company.name
    invite.status = true
    invite.save
  end
  i=i+1
  u=u+4
end
e=0
u=1
5.times do
  e=e+1
  2.times do
    u=u+1
    hourprop=HourProposal.new()
    hourprop.event_id=e
    hourprop.user_id=u
    hourprop.vote=Faker::Date.forward(days: 60)
    hourprop.is_voter_creator=true
    hourprop.count= 0
    hourprop.save
  end
  u=u+2
end
e=0
o=0
5.times do
  e=e+1
  if o==0
    u=[2,3,4]
  elsif o==1
    u=[6,7,8]
  elsif o==2
    u=[10,11,12]
  elsif o==3
    u=[14,15,16]
  elsif o==4
    u=[18,19,20]
  end
  5.times do
    ec=EventChat.new()
    ec.event_id = e
    ec.user_id =u.sample
    ec.content = Faker::Lorem.paragraph(sentence_count: 2)
    ec.save
  end
  7.times do
    comm=Comment.new()
    comm.user_id=u.sample
    comm.event_id = e
    comm.content = Faker::Lorem.paragraph(sentence_count: 2)
    comm.save
  end
  o=o+1
end
i=1
10.times do
  men=Message.new()
  men.target_id=i
  men.sender_id=i+1
  men.content =Faker::Lorem.paragraph(sentence_count: 2)
  men.seen = [true,false].sample
  puts i
  men.save
  i=i+2
end





