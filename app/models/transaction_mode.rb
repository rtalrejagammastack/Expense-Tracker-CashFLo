class TransactionMode < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged
  
  acts_as_paranoid column: :destroyed_at

  # Associations
  # has_many :transactions

  scope :map_id_with_name, -> { map { |mode| [mode.name, mode.id] } }

  scope :map_slug_with_name, -> { map { |mode| [mode.name, mode.slug] } }
end
