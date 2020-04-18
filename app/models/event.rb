class Event < ApplicationRecord
  belongs_to :user
  has_many :event_chat
  has_many :comments
end
