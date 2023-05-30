class User < ApplicationRecord
  has_many :groups, :operations

  validates :name, length: { minimum: 3, message: 'Must be at least 3 characters' }
  validates :email, presence: { message: "can't be blank" }, uniqueness: true
  validates :password, presence: { message: "can't be blank" }
end
