# frozen_string_literal: true

class Business < ApplicationRecord
  has_one_attached :logo
  has_many :coupons, dependent: :delete_all

  validates :name, presence: true, uniqueness: true

  scope :search, lambda { |search_param|
    raise ArgumentError if search_param.blank?

    where('LOWER(name) LIKE ?', "%#{search_param.downcase}%").order(:name)
  }
end
