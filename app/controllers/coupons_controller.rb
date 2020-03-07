# frozen_string_literal: true

class CouponsController < ApplicationController
  def index; end

  def new; end

  def create; end

  def show
    require 'barby/barcode/code_128'
    require 'barby/outputter/html_outputter'

    @coupon = Coupon.find(params.require(:business_id))
    @barcode = Barby::Code128B.new(@coupon.code).to_html.html_safe
  end

  def edit; end

  def update; end

  def destroy; end
end
