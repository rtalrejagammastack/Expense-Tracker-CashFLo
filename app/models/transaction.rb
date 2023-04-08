class Transaction < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  default_scope { order(created_at: :desc) }

  scope :_create_hash_transactions_group_by_date, -> { group_by { |transaction| transaction.created_at.to_date }.map { |date, transaction| [date, transaction] }.to_h }

  # Associations
  belongs_to :user_category
  belongs_to :expense_sub_category
  belongs_to :status, class_name: 'TransactionStatus'
  belongs_to :type, class_name: 'TransactionType'
  belongs_to :mode, class_name: 'TransactionMode'
  belongs_to :payee, class_name: 'User', optional: true
  belongs_to :payer, class_name: 'User', optional: true
end
