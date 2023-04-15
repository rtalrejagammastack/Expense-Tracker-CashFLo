# frozen_string_literal: true

# Model to store all the sub-categories of any expense category.
class ExpenseSubCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  default_scope { order(:name) }

  # Callbacks
  before_save :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :category, class_name: 'ExpenseCategory'
  # has_many :transactions
end
