class EventFile < ApplicationRecord
  belongs_to :event
  has_one_attached :content
end
