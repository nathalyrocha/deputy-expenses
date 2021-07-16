require 'rails_helper'

RSpec.describe Builder::Party do
  subject { Builder::Party.new(line) }

  context 'with a valid line' do
    let(:line) do
      [
        "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PSDB", 
        "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
        "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
        "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
      ]
    end

    it 'saves party' do
      expect{ subject.call }.to change { ::Party.count }.from(0).to(1)
    end
  end

  context 'with a invalid line' do
    context 'party is empty' do
      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end
  
      it 'does not save party' do
        expect{ subject.call }.to_not change { ::Party.count }
      end
    end
   
    context 'the party already exists'do
      let!(:party) { create(:party) }

      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PSDB", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end

      it 'does not save party' do
        expect{ subject.call }.to_not change { ::Party.count }
      end
    end
  end
end