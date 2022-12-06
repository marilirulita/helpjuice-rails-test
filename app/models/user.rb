class User < ApplicationRecord
  has_many :searches, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
