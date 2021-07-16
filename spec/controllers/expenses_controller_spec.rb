require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe 'index' do
    context 'with deputies' do
      let!(:deputy) { create(:deputy) }
      let!(:expense) { create(:expense, deputy: deputy) }

      it 'list all' do
        get :index, params: { deputy_id: deputy.id }

        expect(assigns(:deputy)).to eq deputy
        expect(assigns(:expenses)).to eq [expense]
        expect(response).to render_template(:index)
      end
    end
  end
end