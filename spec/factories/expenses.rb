FactoryBot.define do
  factory :expense do
    net_value { '100,00' }
    description { 'PASSAGEM AÉREA' }
    emission_date { Date.today }
    deputy
    provider
  end
end