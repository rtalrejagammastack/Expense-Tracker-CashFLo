class UserCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  has_one_attached :background, dependent: :destroy

  default_scope { order(:name) }

  # Callbacks
  before_save :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :expense_sub_categories, through: :expense_categories
  has_many :transactions, dependent: :destroy
end
