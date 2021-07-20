FactoryBot.define do
  factory :follower do
    id { 1 }
    follower_id { 1 }
    followed_user_id { 2 }
  end
end