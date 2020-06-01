class OrganizationUser < ApplicationRecord
  belongs_to :organization
  has_one :user
end
