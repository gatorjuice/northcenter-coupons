# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #update' do
    subject(:update_business) { put :update, params: params }

    let!(:business) { create(:business, :with_coupons, name: 'business') }
    let(:params) { { id: business.id, business: { name: 'New Name' } } }

    context 'when admin is signed in' do
      let!(:admin) { create(:admin) }

      before do
        sign_in(admin)
        update_business
      end

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'updates the business' do
        expect(business.reload.name).to eq('New Name')
      end
    end

    context 'when admin is not signed in' do
      before { update_business }

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'does not update the business' do
        expect(business.reload.name).to eq('business')
      end
    end
  end
end
