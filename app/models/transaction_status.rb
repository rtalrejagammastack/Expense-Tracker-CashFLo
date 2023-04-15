class TransactionStatus < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged
  
  acts_as_paranoid column: :destroyed_at

  # Associations
  # has_many :transactions

  scope :map_id_with_name, -> { map { |status| [status.name, status.id] } }

  scope :map_slug_with_name, -> { map { |status| [status.name, status.slug] } }
end
