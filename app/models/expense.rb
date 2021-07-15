class Expense < ApplicationRecord
  validates :net_value, :emission_date, :description, :provider_id, :deputy_id, presence: true

  belongs_to :provider
  belongs_to :deputy
end
