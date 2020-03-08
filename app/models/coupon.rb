# frozen_string_literal: true

require 'barby/barcode/code_128'
require 'barby/outputter/svg_outputter'

class Coupon < ApplicationRecord
  belongs_to :business

  def barcode_svg
    if code.blank?
      'no barcode available'
    else
      Barby::Code128B.new(code).to_svg.html_safe
    end
  end
end
