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
    user_example = User.first
    events_of_example_user = user_example.events
    print("events created by a example user ")
    puts(events_of_example_user)
    puts("EOQ")
    puts("Query 2")
    organization_example = Organization.first
    users_of_org= organization_example.users
    puts(users_of_org)
    puts("EOQ")
    puts("Query 3")
    public_events = Event.where(public:true).pluck(:id)
    puts(organization_example.events.where(event_id:public_events))
    puts("EOQ")
    puts("Query 4")
    private_events = Event.where(public:false).pluck(:id)
    puts(organization_example.events.where(event_id:public_events))
    puts("EOQ")
    puts("Query 5")
    guestss_ids = User.where(guest:true).pluck(:id)
    targetsss_id = Invite.where(target_id:guestss_ids).pluck(:id)
    q_three = User.where(id:targetsss_id)
    puts(q_three)
    puts("EOQ")
    puts("Query 6")
    puts(HourProposal.where(user_id:guestss_ids))
    puts("EOQ")
    puts("Query 7")
    puts(Comment.where(event = Event.first))
    puts("EOQ")
    puts("Query 8")
    puts(user_example.comments)
    puts("EOQ")
    puts("Query 9")
    admnins = User.where(admin:true).pluck(:id)
    org_and_admin = OrganizationUser.where(user_id:admnins).pluck(:user_id)
    puts(User.where(id:org_and_admin))
    puts("EOQ")
    puts("Query 10")
    puts(User.where(admin:true))
    puts("EOQ")
  end
end