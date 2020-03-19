# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    subject(:index_businesses) { get :index }

    let!(:business_a) { create(:business, :with_coupons, name: 'business_a') }
    let!(:business_c) { create(:business, :with_coupons, name: 'business_c') }
    let!(:business_b) { create(:business, :with_coupons, name: 'business_b') }

    context 'when admin is signed in' do
      before do
        sign_in(create(:admin))
        index_businesses
      end

      it 'assigns @businesses in the correct order' do
        expect(assigns(:businesses)).to eq([business_a, business_b, business_c])
      end

      it 'renders the index view' do
        expect(response).to render_template(:index)
      end
    end

    context 'when admin is not signed in' do
      before { index_businesses }

      it 'assigns @businesses' do
        expect(assigns(:businesses)).to eq([business_a, business_b, business_c])
      end

      it 'renders the index view' do
        expect(response).to render_template(:index)
      end
    end
  end
end
