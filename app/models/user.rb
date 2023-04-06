class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :name, presence: true
  validates :phone_number, presence: true, length: { is: 10, message: 'must have 10 digit.' }

  has_many :categories, class_name: 'UserCategory', foreign_key: 'user_id'
end
