# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Business, type: :model do
  subject(:business) { build(:business) }

  it { should have_many(:coupons) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:phone).case_insensitive }
  it { should validate_numericality_of(:phone) }

  it { should validate_presence_of(:street_1) }
  it { should validate_uniqueness_of(:street_1) }

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }

  it { should validate_presence_of(:zip) }
  it { should validate_numericality_of(:zip) }

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
