class Party < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :deputies, dependent: :destroy
end
