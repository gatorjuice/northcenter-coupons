# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #search' do
    subject(:search) { get :search, params: { q: 'zZa' } }

    let!(:business_b) { create(:business, :with_coupons, name: 'Pizza by Alfredo') }
    let!(:business_a) { create(:business, :with_coupons, name: 'Piazza Del Tormini') }
    let!(:business_c) { create(:business, :with_coupons, name: 'Duley Dentistry') }

    before do
      search
    end

    it 'assigns @businesses in the correct order' do
      expect(assigns(:businesses)).to eq([business_a, business_b])
    end

    it 'renders the index view' do
      expect(response).to render_template(:index)
    end

    context 'when the query string is empty' do
      subject(:search) { get :search, params: { q: '' } }

      it 'redirects to the index action if the query is an empty string' do
        expect(response).to render_template(:index)
      end
    end
  end
end
