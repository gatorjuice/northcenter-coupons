# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    name { 'test_business_name' }

    trait :with_coupons do
      coupons { [build(:coupon), build(:coupon), build(:coupon)] }
    end
  end
end
