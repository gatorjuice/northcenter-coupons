# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
  include Devise::Test::ControllerHelpers

  xcontext 'when admin signed in' do
    let!(:admin) { create(:admin) }

    before do
      sign_in(admin)
    end

    describe 'GET #create' do
      subject(:create_coupon) { get :create, params: params }

      let!(:business) { create(:business) }

      let(:params) do
        {
          business_id: business.id,
          coupon: attributes_for(:coupon).merge(business_id: business.id)
        }
      end

      it 'returns http success' do
        create_coupon
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a coupon' do
        expect { create_coupon }.to change { Coupon.count }.by(1)
      end
    end

    describe 'GET #edit' do
      subject(:edit_coupon) { get :edit, params: params }

      let!(:coupon) { create(:coupon) }

      let(:params) { { id: coupon.id } }

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'renders the edit view' do
        expect(response).to render_template(:edit)
      end
    end
  end

  xcontext 'when admin is not signed in' do
    describe 'GET #create' do
      subject(:create_coupon) { get :create, params: params }

      let!(:business) { create(:business) }

      let(:params) do
        {
          business_id: business.id,
          coupon: attributes_for(:coupon).merge(business_id: business.id)
        }
      end

      it 'returns http success' do
        create_coupon
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a coupon' do
        expect { create_coupon }.to change { Coupon.count }.by(0)
      end
    end

    describe 'GET #edit' do
      subject(:edit_coupon) { get :edit, params: params }

      let!(:coupon) { create(:coupon) }

      let(:params) { { id: coupon.id } }

      it 'returns a redirect' do
        edit_coupon
        expect(response).to have_http_status(:redirect)
      end

      it 'does not render the edit view' do
        expect(response).to_not render_template(:show)
      end
    end
  end
end
