class Organization < ApplicationRecord
    has_many :organization_users, dependent: :destroy
    has_many :users, through: :organization_users
    has_many :events, dependent: :destroy
    accepts_nested_attributes_for :organization_users
    has_one_attached :banner
end



#when organization is destroyed
#  OrganizationUser Destroy (0.1ms)  DELETE FROM "organization_users" WHERE "organization_users"."organization_id" = ?  [["organization_id", 1]]
#Event Destroy (0.1ms)  DELETE FROM "events" WHERE "events"."organization_id" = ?  [["organization_id", 1]]
#Organization Destroy (0.2ms)  DELETE FROM "organizations" WHERE "organizations"."id" = ?  [["id", 1]]
#and shall notify all users that had an event of the organization.
#
#

def notify
    id = self.id
    events_of_org = Event.where(organization_id:id)
    user_of_events_ids = Invite.where(event_id:events_of_org).pluck(:target_id)
    array = []
    cont = 0
    user_of_events_ids.each do |t|
        y = Message.new()
        y.target = User.where(id:t)
        y.content = "Organization eliminated"
        y.seen = false
        y.save!
        cont += 1
    end
    print("Users notified of the destroy of the organization=")
    print(cont)
end