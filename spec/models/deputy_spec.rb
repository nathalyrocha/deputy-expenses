require 'rails_helper'

RSpec.describe Deputy, type: :model do
  describe '.search' do
    context 'with deputies' do
      let!(:deputy) { create(:deputy, name: 'Benedita', cpf: '12345612367') }
      let!(:deputy_2) { create(:deputy, name: 'Pedro', party: create(:party, name: 'PT')) }

      context 'downcase' do
        it 'by deputy name' do
          expect(Deputy.search('benedita')).to eq [deputy]
        end
      end

      context 'upcase' do
        it 'by deputy name' do
          expect(Deputy.search('BENEDITA')).to eq [deputy]
        end
      end
    end

    context 'deputies from the same party' do
      let!(:party) { create(:party, name: 'PT') }
      let!(:deputy) { create(:deputy, name: 'Benedita', cpf: '12345612367', party: party) }
      let!(:deputy_2) { create(:deputy, name: 'Pedro', party: party) }

      context 'list all' do
        it 'by party name' do
          expect(Deputy.search('pt')).to eq [deputy, deputy_2]
        end
      end

      context 'list by party' do
        let!(:deputy_2) { create(:deputy, name: 'Pedro') }

        it 'returns one deputy' do
          expect(Deputy.search('pt')).to eq [deputy]
        end
      end
    end
  end
end