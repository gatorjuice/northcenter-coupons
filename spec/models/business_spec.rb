# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Business, type: :model do
  describe '.search' do
    let!(:business_b) { create(:business, :with_coupons, name: 'Pizza by Alfredo') }
    let!(:business_a) { create(:business, :with_coupons, name: 'Piazza Del Tormini') }
    let!(:business_c) { create(:business, :with_coupons, name: 'Duley Dentistry') }

    let(:search_param) { 'zZa' }

    it 'returns the matching businesses' do
      expect(Business.search(search_param)).to eq([business_a, business_b])
    end
  end
end
