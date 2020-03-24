# frozen_string_literal: true

class BusinessesController < ApplicationController
  before_action :authenticate_admin!, only: %w[new create edit update destroy]
  before_action :set_business, only: %w[show edit update destroy]

  def index
    @businesses = Business.order(:name)
  end

  def new
    @business = Business.new
  end

  def create
    business = Business.create!(business_params)
    flash[:success] = 'Business added.'
    redirect_to business_path(business)
  rescue StandardError => e
    flash[:danger] = e
    redirect_to new_business_path
  end

  def show
    @coupons = @business.coupons
  end

  def edit; end

  def update
    @business.update!(business_params)
    flash[:success] = 'Business updated.'
    redirect_to business_path(@business)
  rescue StandardError => e
    flash[:danger] = e
    redirect_to edit_business_path
  end

  def destroy
    if @business.destroy
      flash[:success] = 'Business deleted.'
      redirect_to businesses_path
    else
      redirect_to edit_business_path
    end
  end

  def search
    @businesses = Business.search(search_param)
    render :index
  rescue ArgumentError
    flash[:success] = 'No results found.'
    redirect_to businesses_path
  end

  private

  def set_business
    @business = Business.find(params.require(:id))
  end

  def search_param
    params[:q]
  end

  def business_params
    params.require(:business).permit(:name, :logo)
  end
end
