class TransactionType < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  # Associations
  has_many :transactions
end
