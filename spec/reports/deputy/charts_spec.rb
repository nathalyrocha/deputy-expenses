require 'rails_helper'

RSpec.describe Deputy::Charts do
  describe 'for a given deputy' do
    subject { described_class.new(deputy) }

    context 'calculate expenses report' do
      let!(:deputy) { create(:deputy) }
      let!(:provider) { create(:provider) }
      let!(:expense) { create(:expense, net_value: '100.00', emission_date: '2021-07-01', deputy: deputy, provider: provider) }
      let!(:expense_2) { create(:expense, net_value: '50.00', emission_date: '2021-07-01', deputy: deputy, provider: provider) }

      it '.higher_expense_per_month' do
        expect(subject.higher_expense_per_month).to eq ({"Jul 2021" => BigDecimal('100.00')})
      end

      it '.higher_expense_per_year' do
        expect(subject.higher_expense_per_year).to eq ({"Jan 2021" => BigDecimal('100.00')})
      end

      it '.total_expense_per_month' do
        expect(subject.total_expense_per_month).to eq ({"Jul 2021" => BigDecimal('150.00')})
      end
    end

    context 'with no expenses' do
      let!(:deputy) { create(:deputy) }
      
      it '.higher_expense_per_month' do
        expect(subject.higher_expense_per_month).to eq ({})
      end

      it '.higher_expense_per_year' do
        expect(subject.higher_expense_per_year).to eq ({})
      end

      it '.total_expense_per_month' do
        expect(subject.total_expense_per_month).to eq ({})
      end
    end
  end
end