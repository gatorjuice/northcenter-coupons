# frozen_string_literal: true

class CouponsController < ApplicationController
  def index; end

  def new; end

  def create; end

  def show
    @coupon = Coupon.find(params.require(:id))
  end

  def edit; end

  def update; end

  def destroy; end
end
