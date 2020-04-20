namespace :db do
    task :populate_fake_data => :environment do
        # If you are curious, you may check out the file
        # RAILS_ROOT/test/factories.rb to see how fake
        # model data is created using the Faker and
        # FactoryBot gems.
        puts "Populating database"
        # 10 event venues is reasonable...
        create_list(:event_venue, 10)
        # 50 customers with orders should be alright
        create_list(:customer_with_orders, 50)
        # You may try increasing the number of events:
        create_list(:event_with_ticket_types_and_tickets, 3)
    end
    task :model_queries => :environment do
        puts("Query 1")
        #Get all events created by certain user.
        user_example = User.first
        events_of_example_user = user_example.events
        puts("the events are the following")
        events_of_example_user.each do |event|
            puts("event,with id #{event.id}")
        end
        puts(events_of_example_user)
        puts("EOQ")
        puts("Query 2")
        #Get all users belonging to an organization.
        organization_example = Organization.first
        users_of_org= organization_example.users
        users_of_org.each do |user|
            puts(" #{user.name} is part of this organizations")
        end
        puts(users_of_org)
        puts("EOQ")
        puts("Query 3")
        #Get all public events in an organization.
        public_events = Event.where(public:true).pluck(:id)
        puts(organization_example.events.where(event_id:public_events))
        arrayy =organization_example.events.where(event_id:public_events)
        arrayy.each do |even|
            puts("the id of the event that belongs to the organization is #{even.id}")
        end
        puts("EOQ")
        puts("Query 4")
        #Get all private events in an organization.
        private_events = Event.where(public:false).pluck(:id)
        puts(organization_example.events.where(event_id:private_events))
        priv_evens = organization_example.events.where(event_id:private_events)
        priv_evens.each do |ev|
            puts("the id of the event is #{ev.id}")
        end
        puts("EOQ")
        puts("Query 5")
        #Get all guests that have been invited to a certain event.
        ids_invited = Invite.pluck(:targer_id)
        all_invited_users = User.where(id:ids_invited)
        all_invited_users.each do |usr|
            puts("User invited with the id  = #{usr.id}")
        end
        puts(all_invited_users)
        puts("EOQ")
        puts("Query 6")
        #Get all guests that have voted for a date option in a certain event.
        ids_of_the_ones_who_voted = HourProposal.pluck(:user_id)
        users_mathing_target_id = User.where(id:ids_of_the_ones_who_voted)
        puts(users_mathing_target_id)
        puts("EOQ")
        puts("Query 7")
        #Get all comments written by users on a specific event.
        e = Event.first
        print("All comments for a example event :")
        puts(e.comments)
        total_comnt = e.comments
        countofcm = 0
        total_comnt.each do |comnt|
            puts("coment number #{countofcm} and the content was #{comnt.content}")
            countofcm += 1
        end
        puts("EOQ")
        puts("Query 8")
        #Get all comments written by a specific user on all events.
        puts(user_example.comments)
        total_comnt = user_example.comments
        countofcm = 0
        total_comnt.each do |comnt|
            puts("coment number #{countofcm} and the content was #{comnt.content}")
            countofcm += 1
        end
        puts("EOQ")
        puts("Query 9")
        #Get all users with administrative privileges in an organization.
        admnins = User.where(admin:true).pluck(:id)
        org_and_admin = OrganizationUser.where(user_id:admnins).pluck(:user_id)
        puts(User.where(id:org_and_admin))
        puts("EOQ")
        puts("Query 10")
        #Get all users with administrative privileges in the system.
        puts(User.where(admin:true))
        arry_admin = User.where(admin:true)
        con = 1
        arry_admin.each do |adm|
            puts("this is the admin number #{con}, with the name #{adm.name}")
            con += 1
        end
        puts("EOQ")
    end
end