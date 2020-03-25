# frozen_string_literal: true

class Business < ApplicationRecord
  has_one_attached :logo
  has_many :coupons, dependent: :delete_all

  validates :name, :street_1, presence: true, uniqueness: true
  validates :phone, numericality: { only_integer: true }, presence: true, uniqueness: true, case_sensitive: false
  validates :city, :state, :zip, presence: true
  validates :zip, numericality: { only_integer: true }, presence: true

  scope :search, lambda { |search_param|
    raise ArgumentError if search_param.blank?

    where('LOWER(name) LIKE ?', "%#{search_param.downcase}%").order(:name)
  }
end
