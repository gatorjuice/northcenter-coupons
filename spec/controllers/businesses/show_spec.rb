# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #show' do
    subject(:show_business) { get :show, params: { id: business.id } }

    let!(:business) { create(:business, :with_coupons, name: 'business') }

    context 'when admin is signed in' do
      let!(:admin) { create(:admin) }

      before do
        sign_in(admin)
        show_business
      end

      it 'assigns @business' do
        expect(assigns(:business)).to eq(business)
      end

      it 'renders the show view' do
        expect(response).to render_template(:show)
      end
    end

    context 'when admin is not signed in' do
      before { show_business }

      it 'assigns @business' do
        expect(assigns(:business)).to eq(business)
      end

      it 'renders the show view' do
        expect(response).to render_template(:show)
      end
    end
  end
end
