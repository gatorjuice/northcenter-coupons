# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
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

  describe 'GET #update' do
    it 'returns http success' do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
