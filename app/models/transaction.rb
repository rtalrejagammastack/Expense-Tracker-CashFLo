class Transaction < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  default_scope { order(created_at: :desc) }

  # Associations
  belongs_to :user_category
  belongs_to :expense_sub_category
  belongs_to :status, class_name: 'TransactionStatus'
  belongs_to :type, class_name: 'TransactionType'
  belongs_to :mode, class_name: 'TransactionMode'
  belongs_to :payee, class_name: 'User', optional: true
  belongs_to :payer, class_name: 'User', optional: true
end
