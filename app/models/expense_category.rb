class ExpenseCategory < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  default_scope { order(:name) }

  # Callbacks
  before_save :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :user_category, optional: true
  has_many :sub_categories, class_name: 'ExpenseSubCategory', foreign_key: 'category_id', dependent: :destroy
end
