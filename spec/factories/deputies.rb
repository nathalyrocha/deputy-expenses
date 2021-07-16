FactoryBot.define do
  factory :deputy do
    name { 'João' }
    cpf { '12312312312' }
    state { 'RJ' }
    party
  end
end