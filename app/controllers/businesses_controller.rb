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
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @business.update(business_params)
      redirect_to @business
    else
      render :edit
    end
  end

  def destroy
    if @business.delete
      redirect_to businesses_path
    else
      render :edit
    end
  end

  private

  def set_business
    @business = Business.find(params.require(:id))
  end

  def business_params
    params.require(:business).permit(:name)
  end
end
