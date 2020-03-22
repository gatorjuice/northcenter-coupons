# frozen_string_literal: true

class Business < ApplicationRecord
  has_one_attached :logo
  has_many :coupons, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
