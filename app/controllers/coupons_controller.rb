# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :authenticate_admin!, only: %w[create edit update destroy]
  before_action :set_coupon, only: %w[show edit update]

  def index; end

  def new
    @coupon = Coupon.new(business_id: params.require(:business_id))
  end

  def create
    coupon = Coupon.create!(coupon_params)
    flash[:success] = 'Coupon Saved.'
    redirect_to business_path(coupon.business)
  rescue StandardError => e
    flash[:danger] = e
    redirect_to new_business_coupon_path(coupon.business)
  end

  def show; end

  def edit; end

  def update
    @coupon.update!(coupon_params)
    flash[:success] = 'Coupon Updated.'
    redirect_to coupon_path(@coupon)
  rescue StandardError => e
    flash[:danger] = e
    redirect_to new_business_coupon_path(@coupon.business)
  end

  def destroy; end

  private

  def coupon_params
    params.require(:coupon).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :business_id,
      :code
    )
  end

  def set_coupon
    @coupon = Coupon.find(params.require(:id))
  end
end
