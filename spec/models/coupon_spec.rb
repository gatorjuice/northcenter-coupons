# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe '#barcode_svg' do
    context 'when coupon has a code' do
      let(:coupon) { build(:coupon) }
      let(:code) { '1234567890' }

      before do
        expect(Barby::Code128B).to receive(:new).with(code).and_return(Barby::Code128B.new(code))
      end

      it 'calls the barby gem to generate a barcode svg' do
        coupon.barcode_svg
      end
    end

    context 'when coupon does not have a code' do
      it 'returns a no bar code message' do
        expect(build(:coupon, code: nil).barcode_svg).to eq('no barcode available')
      end
    end
  end
end
