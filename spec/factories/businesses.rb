# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    name { 'test_business_name' }

    trait :with_logo do
      logo do
        Rack::Test::UploadedFile.new(
          Rails.root.join('spec/support/assets/test_image.png'),
          'image/png'
        )
      end
    end

    trait :with_coupons do
      coupons { [build(:coupon), build(:coupon), build(:coupon)] }
    end
  end
end
