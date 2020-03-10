# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
  include Devise::Test::ControllerHelpers

  context 'when admin signed in' do
    let!(:admin) { create(:admin) }

    before do
      sign_in(admin)
    end

    describe 'GET #show' do
      let(:coupon) { create(:coupon) }

      before do
        get :show, params: { id: coupon.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'renders the show view' do
        expect(response).to render_template(:show)
      end
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
        expect {create_coupon}.to change { Coupon.count }.by(1)
      end
    end
  end

  context 'when admin is not signed in' do
    describe 'GET #show' do
      let(:coupon) { create(:coupon) }

      before do
        get :show, params: { id: coupon.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'renders the show view' do
        expect(response).to render_template(:show)
      end
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
        expect {create_coupon}.to change { Coupon.count }.by(0)
      end
    end
  end
end
