# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #destroy' do
    subject(:destroy_business) { post :destroy, params: { id: business.id } }

    let!(:business) { create(:business, :with_coupons) }

    context 'when admin is signed in' do
      before { sign_in(create(:admin)) }

      it 'deletes the business' do
        expect { destroy_business }.to change { Business.count }.by(-1)
      end

      it 'deletes the coupons associated to the business' do
        expect { destroy_business }.to change { Coupon.count }.by(-3)
      end
    end

    context 'when admin is not signed in' do
      it 'does not delete the business' do
        expect { destroy_business }.to change { Business.count }.by(0)
      end

      it 'does not delete the business\'s coupons' do
        expect { destroy_business }.to change { Coupon.count }.by(0)
      end
    end
  end
end
