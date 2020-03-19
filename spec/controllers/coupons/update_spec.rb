# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #update' do
    subject(:update_coupon) { get :update, params: params }

    let!(:coupon) { create(:coupon) }
    let(:params) { { id: coupon.id, coupon: { name: 'updated name' } } }

    context 'when admin signed in' do
      let!(:admin) { create(:admin) }

      before do
        sign_in(admin)
        update_coupon
      end

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'updates the coupon' do
        expect(coupon.reload.name).to eq('updated name')
      end
    end

    context 'when admin is not signed in' do
      before { update_coupon }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'does not update the coupon' do
        expect(coupon.reload.name).to eq('Test Coupon')
      end
    end
  end
end
