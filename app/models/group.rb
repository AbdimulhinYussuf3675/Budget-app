class Group < ApplicationRecord
  has_many :operations
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true

  def total_spent
    operations.map(&:amount).sum
  end
end
