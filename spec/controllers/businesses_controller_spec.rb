# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let!(:business_a) { create(:business, :with_coupons, name: 'business_a') }
  let!(:business_c) { create(:business, :with_coupons, name: 'business_c') }
  let!(:business_b) { create(:business, :with_coupons, name: 'business_b') }

  context 'when admin is signed in' do
    let!(:admin) { create(:admin) }

    before do
      sign_in(admin)
    end

    describe 'GET #index' do
      before do
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @businesses' do
        expect(assigns(:businesses)).to eq([business_a, business_b, business_c])
      end

      it 'renders the index view' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      before do
        get :show, params: { id: business_a.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @business' do
        expect(assigns(:business)).to eq(business_a)
      end

      it 'renders the index view' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #update' do
      let(:params) { { id: business_a.id, business: { name: 'New Name' } } }

      before { put :update, params: params }

      it 'returns http success' do
        expect(response).to have_http_status(:redirect)
      end

      it 'updates the business' do
        expect(business_a.reload.name).to eq('New Name')
      end
    end

    describe 'GET #create' do
      subject(:create_business) { post :create, params: params }

      let(:params) { { business: attributes_for(:business) } }

      it 'returns http success' do
        create_business
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a business' do
        expect { create_business }.to change { Business.count }.by(1)
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, params: { id: business_a.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @business' do
        expect(assigns(:business)).to eq(business_a)
      end

      it 'renders the edit view' do
        expect(response).to render_template(:edit)
      end
    end

    describe 'GET #destroy' do
      subject(:delete) { post :destroy, params: { id: business_a.id } }

      it 'deletes the business' do
        expect { delete }.to change { Business.count }.by(-1)
      end
    end
  end

  context 'when admin is not signed in' do
    describe 'GET #index' do
      before do
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @businesses' do
        expect(assigns(:businesses)).to eq([business_a, business_b, business_c])
      end

      it 'renders the index view' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      before do
        get :show, params: { id: business_a.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @business' do
        expect(assigns(:business)).to eq(business_a)
      end

      it 'renders the index view' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #update' do
      let(:params) { { id: business_a.id, business: { name: 'New Name' } } }

      before { put :update, params: params }

      it 'returns http success' do
        expect(response).to have_http_status(:redirect)
      end

      it 'does not update the business' do
        expect(business_a.reload.name).to eq('business_a')
      end
    end

    describe 'GET #create' do
      subject(:create_business) { post :create, params: params }

      let(:params) { { business: attributes_for(:business) } }

      it 'returns http success' do
        create_business
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a business' do
        expect { create_business }.to change { Business.count }.by(0)
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, params: { id: business_a.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:redirect)
      end
    end

    describe 'GET #destroy' do
      subject(:delete) { post :destroy, params: { id: business_a.id } }

      it 'deletes the business' do
        expect { delete }.to change { Business.count }.by(0)
      end
    end
  end
end
