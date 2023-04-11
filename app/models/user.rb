# frozen_string_literal: true

# Model to Store User data
class User < ApplicationRecord
  include ApplicationHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  acts_as_paranoid column: :destroyed_at

  has_one_attached :avatar, dependent: :destroy
  
  DEFAULT_CATEGORY = "Family".freeze

  # Callbacks
  after_create :create_default_category

  validates :name, presence: true
  validates :phone_number, presence: true, length: { is: 10, message: I18n.t('activerecord.model.user.attributes.phone_number') }

  # Associations
  has_many :categories, class_name: 'UserCategory', foreign_key: 'user_id', dependent: :destroy
  has_many :expense_categories, through: :categories
  has_many :expense_sub_categories, through: :expense_categories, source: :sub_categories
  has_many :transactions, class_name: 'Transaction', foreign_key: 'payer_id', dependent: :destroy
  has_many :receive_transactions, class_name: 'Transaction', foreign_key: 'payee_id', dependent: :destroy

  def create_default_category
    default_category = categories.create(name: DEFAULT_CATEGORY)
    default_category.background.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'family.png')), filename: 'family.png', content_type: 'image/png')
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["receive_transactions", "transactions"]
    default_category.background.attach(image_file('family.png'))
  end
end
