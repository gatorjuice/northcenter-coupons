# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Business, type: :model do
  describe '.search' do
    subject(:search) { described_class.search(search_param) }

    let!(:business_b) { create(:business, :with_coupons, name: 'Pizza by Alfredo') }
    let!(:business_a) { create(:business, :with_coupons, name: 'Piazza Del Tormini') }
    let!(:business_c) { create(:business, :with_coupons, name: 'Duley Dentistry') }

    let(:search_param) { 'zZa' }

    it 'returns the matching businesses' do
      expect(search).to eq([business_a, business_b])
    end

    context 'when search_param is blank' do
      let(:search_param) { '' }

      it 'raises an ArgumentError' do
        expect { search }.to raise_exception(ArgumentError)
      end
    end
  end
end
