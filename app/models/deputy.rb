class Deputy < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  paginates_per 10

  validates :name, :cpf, :state, :party_id, presence: true
  validates :cpf, uniqueness: true

  validate :ensure_state_is_rj

  belongs_to :party
  has_many :expenses, dependent: :destroy

  after_save :broadcast!

  def photo
    "https://www.camara.leg.br/internet/deputado/bandep/#{avatar_id}.jpg"
  end

  def self.search(search)
    if search
      joins(:party).where(["deputies.name ILIKE ? OR parties.name ILIKE ?", "%#{search}%", "%#{search}%"])
    else
      all
    end
  end

  def broadcast!
    ActionCable.server.broadcast(
      'deputy_channel', 
      ApplicationController.render(
      partial: 'deputies/deputy',
      locals: { deputy: self }
      )
    )
  end

  private

  def ensure_state_is_rj
    return true if state == 'RJ'

    self.errors.add(:base, 'Invalid State')
  end
end
