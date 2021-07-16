require 'rails_helper'

RSpec.describe Builder::Provider do
  subject { Builder::Provider.new(line) }

  context 'with a valid line' do
    let(:line) do
      [
        "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
        "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
        "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
        "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
      ]
    end

    it 'saves provider' do
      expect{ subject.call }.to change { ::Provider.count }.from(0).to(1)
    end
  end

  context 'with a invalid line' do
    context 'provider is empty' do
      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end
  
      it 'does not save provider' do
        expect{ subject.call }.to_not change { ::Provider.count }
      end
    end
   
    context 'the provider already exists'do
      let!(:provider) { create(:provider) }

      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end

      it 'does not save provider' do
        expect{ subject.call }.to_not change { ::Provider.count }
      end
    end
  end
end