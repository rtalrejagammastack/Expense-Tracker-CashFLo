class UserCategory < ApplicationRecord
  # Callbacks
  before_save :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :user
end
