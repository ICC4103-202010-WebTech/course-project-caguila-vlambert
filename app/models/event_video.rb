class EventVideo < ApplicationRecord
  belongs_to :event
  has_one_attached :content
end
