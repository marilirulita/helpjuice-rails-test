class User < ApplicationRecord
  has_many :searches, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :articles, through: :records


  validates :username, presence: true, uniqueness: true
end
