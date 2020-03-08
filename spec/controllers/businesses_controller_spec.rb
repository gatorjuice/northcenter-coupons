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
      let(:business_params) { { business: { name: 'Test Agency' } } }

      before do
        put :update, params: business_params
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index view' do
        expect(response).to render_template(:show)
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
      subject(:delete) { post :destroy, params: { id: business_a.id } }

      it 'deletes the business' do
        expect { delete }.to change { Business.count }.by(0)
      end
    end
  end
end
