class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  acts_as_paranoid column: :destroyed_at

  has_one_attached :avatar, dependent: :destroy

  validates :name, presence: true
  validates :phone_number, presence: true, length: { is: 10, message: 'must have 10 digit.' }

  # Associations
  has_many :categories, class_name: 'UserCategory', foreign_key: 'user_id', dependent: :destroy
  has_many :expense_categories, through: :categories
  has_many :expense_sub_categories, through: :expense_categories, source: :sub_categories
  has_many :transactions, class_name: 'Transaction', foreign_key: 'payer_id', dependent: :destroy
  has_many :receive_transactions, class_name: 'Transaction', foreign_key: 'payee_id', dependent: :destroy
end
