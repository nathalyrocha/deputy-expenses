class Provider < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :expense
end
