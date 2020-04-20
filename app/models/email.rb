class Email < ApplicationRecord
  belongs_to :user
  scope :active, -> {where(active: true)}
  validates :mail, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
