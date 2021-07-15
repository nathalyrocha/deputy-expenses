class Expense < ApplicationRecord
  paginates_per 10

  validates :net_value, :emission_date, :description, :provider_id, :deputy_id, presence: true

  belongs_to :provider
  belongs_to :deputy

  scope :order_by_date, -> { order(emission_date: :asc) }
end
