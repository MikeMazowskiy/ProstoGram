FactoryBot.define do
  factory :post_hash_tag do
    association :post
    association :hash_tag
    id { 1 }
    post_id { 2 }
    hash_tag_id { 2 }
  end
end
