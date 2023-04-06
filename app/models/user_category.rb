class UserCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at
  
  # Callbacks
  before_save :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :user
end
