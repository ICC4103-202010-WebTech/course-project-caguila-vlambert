class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :event_chat, :dependent => :delete_all
  has_many :comments,:dependent => :delete_all
  has_many :hour_proposals, :dependent => :delete_all
  has_many :invites
  belongs_to :organization, optional: true
  before_destroy :notify_event_deleted
  has_many_attached :event_files
  has_many :images ,inverse_of: :event
  accepts_nested_attributes_for :images

  def notify_event_deleted
    my_id = self.id
    all_useres = HourProposal.where(event_id:my_id).pluck(:user_id)
    useres_total_vot = User.where(user_id:all_useres)
    con = 0
    useres_total_vot.each do |usr|
      y = Message.new()
      y.target = usr
      y.content = "the event has been deleted and your hour proposal two"
      y.seen = false
      y.save!
      con += 1
    end
    puts("Event deleted succesfully and ")
    print(con)
    print(" useres were notified")
  end
end


#on a destroy event, we shall find these deletes  EventChat Destroy (0.1ms)  DELETE FROM "event_chats" WHERE "event_chats"."event_id" = ?  [["event_id", 1]]
  #Comment Destroy (0.1ms)  DELETE FROM "comments" WHERE "comments"."event_id" = ?  [["event_id", 1]]
  #HourProposal Destroy (0.1ms)  DELETE FROM "hour_proposals" WHERE "hour_proposals"."event_id" = ?  [["event_id", 1]]
  #Event Destroy (0.3ms)  DELETE FROM "events" WHERE "events"."id" = ?  [["id", 1]]
  #also notifys the useres who proposed an ahour for the event
  
