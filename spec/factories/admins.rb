# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { 'test@test.com' }
    password { 'password' }
  end
end
