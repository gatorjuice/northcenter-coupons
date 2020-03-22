# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #create' do
    subject(:create_business) { post :create, params: params }

    context 'when admin is signed in' do
      before { sign_in(create(:admin)) }

      let(:params) { { business: attributes_for(:business) } }

      it 'returns http redirect' do
        create_business
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a business' do
        expect { create_business }.to change { Business.count }.by(1)
      end

      context 'when adding a logo' do
        let(:params) { { business: attributes_for(:business, :with_logo) } }

        it 'adds the logo to the business' do
          create_business
          expect(Business.last.logo.attached?).to eq(true)
        end
      end
    end

    context 'when admin is not signed in' do
      let(:params) { { business: attributes_for(:business) } }

      it 'returns http redirect' do
        create_business
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a business' do
        expect { create_business }.to change { Business.count }.by(0)
      end
    end
  end
end
