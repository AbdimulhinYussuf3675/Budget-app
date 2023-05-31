class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_operations, dependent: :destroy
  has_many :groups, through: :group_operations

  validates :name, presence: true
  validates :amount, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                     message: 'Please enter a valid number' }
  validates :groups, presence: { message: 'Must have at least one category' }, length: { minimum: 1 }
end
