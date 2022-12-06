class Article < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records
  
  validates :title, presence: true, uniqueness: true
end
