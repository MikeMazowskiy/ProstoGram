require 'ffaker'
FactoryBot.define do
  factory :user do
    id {15}
    email { FFaker::Internet.email}
    password { '111111' }
    password_confirmation { '111111' }
  end

  factory :user1, class: "User" do
    id { 1 }
    email { FFaker::Internet.email}
    password { '111111' }
    password_confirmation { '111111' }
    username {FFaker::Name.name}
    name{FFaker::Name.first_name}
  end
  factory :user2,class:  "User" do
    id { 2 }
    email { FFaker::Internet.email}
    password { '111111' }
    password_confirmation { '111111' }
    username {FFaker::Name.name}
    name{FFaker::Name.first_name}
  end
  factory :user3,class:  "User" do
    id { 3 }
    email { FFaker::Internet.email}
    password { '111111' }
    password_confirmation { '111111' }
    username {FFaker::Name.name}
    name{FFaker::Name.first_name}
  end
end
