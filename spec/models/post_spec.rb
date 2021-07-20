require 'rails_helper'
RSpec.describe Post, type: :model do

  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_one_attached(:image)}

  it { is_expected.to validate_presence_of(:image)}

  it { is_expected.to have_many(:comments)}
  it { is_expected.to have_many(:likes) }

  it { is_expected.to have_many(:post_hash_tags) }
  it { is_expected.to have_many(:hash_tags).through(:post_hash_tags) }

  before { @user = create(:user) }
  context 'validates image format' do
    it 'allows to set png file as an image' do
      subject.attributes = attributes_for(:post)
      subject.user = @user
      is_expected.to be_valid
    end

    it 'allows to set txt file as an image' do
      subject.attributes = attributes_for(:post, :with_invalid_image)
      subject.user = @user
      is_expected.to be_invalid
    end
  end

  let!(:hash_tags) do
    @post_with_hash_tag = create(:post_with_hash_tag)
  end
  context "hash tags extract" do
    it "returns extract create hash tags" do
      expect(@post_with_hash_tag.extract_name_hash_tags).to eq(['test', 'ab'])
    end
  end

  context "callback" do
    it "after commit" do
      @post_with_hash_tag.run_callbacks(:commit)
    end
  end

  context "hash tags create" do
    it "returns extract create hash tags" do
      expect(@post_with_hash_tag.create_hash_tags).to eq(['test', 'ab'])
    end
  end

  context "image_presence" do
    before { @post_without_image = Post.new(description: "abc", user_id: User.last.id) }

    it "not save post" do
      expect(@post_without_image.save).to be_falsey
    end

    it "post invalid" do
      expect(@post_without_image.valid?).to be_falsey
    end

    it "not attached" do
      expect(@post_without_image.image.attached?).to be_falsey
    end
  end
end