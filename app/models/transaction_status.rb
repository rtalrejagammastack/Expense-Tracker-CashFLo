class TransactionStatus < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  # Associations
  has_many :transactions

  scope :map_id_with_name, -> { map { |status| [status.name, status.id] } }
end
