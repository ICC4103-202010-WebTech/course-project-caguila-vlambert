class Event < ApplicationRecord
  belongs_to :user
  has_many :event_chat, :dependent => :delete_all
  has_many :comments,:dependent => :delete_all
  has_many :hour_proposals, :dependent => :delete_all
end
