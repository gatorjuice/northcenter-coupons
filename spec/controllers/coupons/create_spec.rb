# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #create' do
    subject(:create_coupon) { get :create, params: params }

    let!(:business) { create(:business) }

    let(:params) do
      {
        business_id: business.id,
        coupon: attributes_for(:coupon).merge(business_id: business.id)
      }
    end

    context 'when admin signed in' do
      let!(:admin) { create(:admin) }

      before { sign_in(admin) }

      it 'returns http redirect' do
        create_coupon
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a coupon' do
        expect { create_coupon }.to change { Coupon.count }.by(1)
      end
    end

    context 'when admin is not signed in' do
      it 'returns http redirect' do
        create_coupon
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a coupon' do
        expect { create_coupon }.to change { Coupon.count }.by(0)
      end
    end
  end
end
