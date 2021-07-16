require 'rails_helper'

RSpec.describe DeputiesController, type: :controller do
  describe 'index' do
    context 'with deputies' do
      let!(:deputy) { create(:deputy) }

      it 'list all' do
        get :index

        expect(assigns(:deputies)).to eq [deputy]
        expect(response).to render_template(:index)
      end
    end
  end
end