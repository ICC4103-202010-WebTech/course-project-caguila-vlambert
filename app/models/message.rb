class Message < ApplicationRecord
  belongs_to :target, class_name => "User", :foreign_key => 'target_id'
  belongs_to :sender, class_name => "User", :foreign_key => 'sender_id', optional: true 
end
