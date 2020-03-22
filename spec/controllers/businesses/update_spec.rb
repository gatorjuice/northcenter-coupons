# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #update' do
    subject(:update_business) { put :update, params: params }

    let!(:business) { create(:business, :with_coupons, name: 'business') }
    let(:params) { { id: business.id, business: { name: 'New Name' } } }

    context 'when admin is signed in' do
      before do
        sign_in(create(:admin))
        update_business
      end

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'updates the business' do
        expect(business.reload.name).to eq('New Name')
      end

      context 'when updating a logo' do
        let(:params) { { id: business.id, business: attributes_for(:business, :with_logo) } }

        it 'adds the logo to the business' do
          update_business
          expect(business.logo.attached?).to eq(true)
        end
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
