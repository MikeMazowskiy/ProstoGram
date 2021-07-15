FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email}
    password { '111111' }
    password_confirmation { '111111' }
  end
end
