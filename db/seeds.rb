Coupon.create!(
  name: "20\% off!",
  description: 'welcome to dev business',
  start_date: 2.days.ago,
  end_date: 10.days.from_now,
  business: Business.create!(name: 'Dev Business'),
  code: '123456789'
)
