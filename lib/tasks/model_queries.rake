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
        print("events created by a example user ")
        puts(events_of_example_user)
        puts("EOQ")
        puts("Query 2")
        #Get all users belonging to an organization.
        organization_example = Organization.first
        users_of_org= organization_example.users
        puts(users_of_org)
        puts("EOQ")
        puts("Query 3")
        #Get all public events in an organization.
        public_events = Event.where(public:true).pluck(:id)
        puts(organization_example.events.where(event_id:public_events))
        puts("EOQ")
        puts("Query 4")
        #Get all private events in an organization.
        private_events = Event.where(public:false).pluck(:id)
        puts(organization_example.events.where(event_id:public_events))
        puts("EOQ")
        puts("Query 5")
        #Get all guests that have been invited to a certain event.
        ids_invited = Invite.pluck(:targer_id)
        all_invited_users = User.where(id:ids_invited)
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
        puts("EOQ")
        puts("Query 8")
        #Get all comments written by a specific user on all events.
        puts(user_example.comments)
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
        puts("EOQ")
    end
end