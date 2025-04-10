class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :points, numericality: { greater_than_or_equal_to: 0 }

  has_many :redemptions
end
