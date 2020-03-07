class Business < ApplicationRecord
  has_many :coupons, dependent: :delete_all
end
