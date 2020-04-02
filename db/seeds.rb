# frozen_string_literal: true

Admin.create!(
  email: 'test@test.com',
  password: 'password'
)

dev_business = Business.create!(
  name: 'Dev Business',
  street_1: 'dev street',
  phone: '5555555555',
  city: 'dev town',
  state: 'IL',
  zip: '60614'
)

Coupon.create!(
  name: "20\% off!",
  description: 'welcome to dev business',
  start_date: 2.days.ago,
  end_date: 10.days.from_now,
  business: dev_business,
  code: '123456789'
)
