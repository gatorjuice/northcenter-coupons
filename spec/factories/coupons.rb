# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    name { 'Test Coupon' }
    description { 'this is a test coupon' }
    start_date { 5.days.ago }
    end_date { 5.days.from_now }
    code { '1234567890' }
  end
end
