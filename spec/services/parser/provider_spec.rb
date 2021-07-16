require 'rails_helper'

RSpec.describe Parser::Provider do
  let(:line) do
    [
      "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
      "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
      "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
      "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
    ]
  end

  subject { Parser::Provider.new(line) }

  context 'with a valid line' do
    it 'extracts name' do
      expect(subject.name).to eq 'TAM'
    end
  end
end