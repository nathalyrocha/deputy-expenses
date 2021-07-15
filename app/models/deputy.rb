class Deputy < ApplicationRecord
  paginates_per 10

  validates :name, :cpf, :state, :party_id, presence: true
  validates :cpf, uniqueness: true

  validate :ensure_state_is_rj

  belongs_to :party
  has_many :expenses, dependent: :destroy

  private

  def ensure_state_is_rj
    return true if state == 'RJ'

    self.errors.add(:base, 'Invalid State')
  end
end
