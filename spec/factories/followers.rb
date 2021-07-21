FactoryBot.define do
  factory :follower do
    id { 1 }
    follower_id { 1 }
    followed_user_id { 2 }
  end

  factory :following_check, class: "Follower" do
    id { 2 }
    follower_id { 15 }
    followed_user_id { 2 }
  end
end