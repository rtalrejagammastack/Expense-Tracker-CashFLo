class UserCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  DEFAULT_CATEGORY = "Family".freeze
  
  default_scope { order(:name) }

  # Callbacks
  before_save :capital_first_letter
  
  # Validations
  validates :name, presence: true
  
  # Associations
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :expense_sub_categories, through: :expense_categories, source: :sub_categories
  has_many :transactions, dependent: :destroy
  has_one_attached :background, dependent: :destroy

  def expense_subcategories_by_expense_category_hash
    subcategories_by_expense_category = {}
    expense_sub_categories.group_by(&:category_id).map do |key,value|
      subcategories_by_expense_category[key] = value.pluck(:name).join(', ')
    end
    return subcategories_by_expense_category
  end
end
