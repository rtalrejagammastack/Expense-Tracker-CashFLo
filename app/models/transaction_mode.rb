class TransactionMode < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  # Associations
  has_many :transactions

  scope :map_id_with_name, -> { map { |mode| [mode.name, mode.id] } }
end
