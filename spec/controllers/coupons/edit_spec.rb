# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #edit' do
    subject(:edit_coupon) { get :edit, params: { id: coupon.id } }

    let!(:coupon) { create(:coupon) }

    context 'when admin signed in' do
      let!(:admin) { create(:admin) }

      before do
        sign_in(admin)
        edit_coupon
      end

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'renders the edit view' do
        expect(response).to render_template(:edit)
      end
    end

    context 'when admin is not signed in' do
      before { edit_coupon }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'does not render the edit view' do
        expect(response).to_not render_template(:edit)
      end
    end
  end
end
