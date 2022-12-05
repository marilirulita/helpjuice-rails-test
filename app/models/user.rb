class User < ApplicationRecord
  has_many :searches

  validates :username, presence: true
end
