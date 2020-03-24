# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    sequence(:name) { |n| "test_business_name_#{n}" }
    sequence(:street_1) { |n| "#{n} main street" }
    street_2 { '' }
    city { 'chicago' }
    state { 'IL' }
    zip { '60602' }
    sequence(:phone) { |n| "312123456#{n}" }

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
