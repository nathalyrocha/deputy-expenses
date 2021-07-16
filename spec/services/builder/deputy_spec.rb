require 'rails_helper'

RSpec.describe Builder::Deputy do
  let(:party) { create(:party) }

  subject { Builder::Deputy.new(line, party) }

  context 'with a valid line' do
    let(:line) do
      [
        "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
        "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
        "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
        "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
      ]
    end

    it 'saves deputy' do
      expect{ subject.call }.to change { ::Deputy.count }.from(0).to(1)
    end
  end

  context 'with a invalid line' do
    context 'state is invalid' do
      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "SC", "PL", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end
  
      it 'does not save deputy' do
        expect{ subject.call }.to_not change { ::Deputy.count }
      end
    end
   
    context 'cpf is empty'do
      let(:line) do
        [
          "Jorge Goetten", "", "214694", "563", "2019", "RJ", "PL", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end

      it 'does not save deputy' do
        expect{ subject.call }.to_not change { ::Deputy.count }
      end
    end
  end
end