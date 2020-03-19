# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #edit' do
    subject(:edit_business) { get :edit, params: { id: business.id } }

    let!(:business) { create(:business, :with_coupons, name: 'business') }

    context 'when admin is signed in' do
      before do
        sign_in(create(:admin))
        edit_business
      end

      it 'assigns @business' do
        expect(assigns(:business)).to eq(business)
      end

      it 'renders the edit view' do
        expect(response).to render_template(:edit)
      end
    end

    context 'when admin is not signed in' do
      before { edit_business }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'does not render the edit view' do
        expect(response).to_not render_template(:edit)
      end
    end
  end
end
