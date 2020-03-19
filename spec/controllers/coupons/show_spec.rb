# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouponsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #show' do
    subject(:show_coupon) { get :show, params: { id: coupon.id } }

    let!(:coupon) { create(:coupon) }

    context 'when admin signed in' do
      let!(:admin) { create(:admin) }

      before do
        sign_in(admin)
        show_coupon
      end

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'renders the show view' do
        expect(response).to render_template(:show)
      end
    end

    context 'when admin is not signed in' do
      before { show_coupon }

      it 'assigns @coupon' do
        expect(assigns(:coupon)).to eq(coupon)
      end

      it 'renders the show view' do
        expect(response).to render_template(:show)
      end
    end
  end
end
