# frozen_string_literal: true

require 'barby/barcode/code_128'
require 'barby/outputter/svg_outputter'

class Coupon < ApplicationRecord
  belongs_to :business

  def barcode_svg
    Barby::Code128B.new(code).to_svg.html_safe
  end
end
