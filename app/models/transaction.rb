class Transaction < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  self.per_page = 25

  default_scope { order(created_at: :desc) }
  
  scope :create_hash_transactions_group_by_date, -> { group_by { |transaction| transaction.created_at.to_date }.map { |date, transaction| [date, transaction] }.to_h }

  # Validations
  validates :amount, presence: :true
  
  # Associations
  belongs_to :user_category
  belongs_to :expense_sub_category
  belongs_to :status, class_name: 'TransactionStatus'
  belongs_to :type, class_name: 'TransactionType'
  belongs_to :mode, class_name: 'TransactionMode'
  belongs_to :payee, class_name: 'User', optional: true
  belongs_to :payer, class_name: 'User', optional: true
  has_many_attached :documents, dependent: :destroy
  
  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "description", "destroyed_at", "expense_sub_category_id", "id", "mode_id", "payee_id", "payee_name", "payer_id", "payer_name", "slug", "status_id", "type_id", "updated_at", "user_category_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["payee", "payer"]
  end 
end
