require 'ffaker'
FactoryBot.define do
  factory :post do
    association :user
    description { FFaker::Lorem.sentence}
    image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png'))}

    trait(:with_invalid_image) do
      image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/text.txt'))}
    end
  end

  factory :post_with_hash_tag, class: "Post" do
    association :user
    id { 2 }
    description { '#test abba #ab /dasdas .fsdfs //fsdfs $fsdfsd %fsfsd ^fdssd @sdfsd'  }
    image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png'))}
  end

  factory :post1, class: "Post" do
    association :user
    id { 3 }
    description { FFaker::Lorem.sentence}
    image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png'))}
  end

end
