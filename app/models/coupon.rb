# frozen_string_literal: true

require 'barby/barcode/code_128'
require 'barby/outputter/svg_outputter'

class Coupon < ApplicationRecord
  belongs_to :business

  def barcode_svg
    if code
      Barby::Code128B.new(code).to_svg.html_safe
    else
      'no barcode available'
    end
  end
end
