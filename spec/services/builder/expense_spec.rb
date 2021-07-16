require 'rails_helper'

RSpec.describe Builder::Expense do
  subject { Builder::Expense.new(line) }

  context 'with a valid line' do
    let(:line) do
      [
        "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
        "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
        "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
        "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
      ]
    end

    it 'saves expense' do
      expect{ subject.save }.to change { ::Expense.count }.from(0).to(1)
      .and change { ::Deputy.count }.from(0).to(1)
      .and change { ::Provider.count }.from(0).to(1)
      .and change { ::Party.count }.from(0).to(1)
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
  
      it 'does not save expense' do
        expect{ subject.save }.to_not change { ::Expense.count }
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

      it 'does not save expense' do
        expect{ subject.save }.to_not change { ::Expense.count }
      end
    end

    context 'net value is empty'do
      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end

      it 'does not save expense' do
        expect{ subject.save }.to_not change { ::Expense.count }
      end
    end

    context 'emission date is empty'do
      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
          "56", "998", "PASSAGEM AÉREA - SIGEPA", "0", "", "TAM", "", "9572139366727", 
          "0", "", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end

      it 'does not save expense' do
        expect{ subject.save }.to_not change { ::Expense.count }
      end
    end

    context 'description is empty'do
      let(:line) do
        [
          "Jorge Goetten", "43927998915", "214694", "563", "2019", "RJ", "PL", 
          "56", "998", "", "0", "", "TAM", "", "9572139366727", 
          "0", "2020-12-28T12:00:00", "1752.25", "0", "-1752.25", "12", "2020", "0", 
          "JORGE GOETTEN DE LIMA", "BSB/CGH", "0", "0", "", "3473", "22460", ""
        ]
      end

      it 'does not save expense' do
        expect{ subject.save }.to_not change { ::Expense.count }
      end
    end
  end
end