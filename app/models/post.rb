class Post < ApplicationRecord
  #User
  belongs_to :user
  has_one_attached :image

  validates_format_of :image, :with => %r{\.(png|jpg|jpeg)$}i, :multiline => true, :message => "Use a real image"

  validate :image_presence

  #Comments
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :destroy

  #Hash Tags
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
end
