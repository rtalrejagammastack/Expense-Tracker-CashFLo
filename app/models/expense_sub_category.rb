class ExpenseSubCategory < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  default_scope { order(:name) }

  # Callbacks
  before_save :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :category, class_name: 'ExpenseCategory'
  belongs_to :user_category, optional: true
  has_many :transactions, dependent: :destroy
end
