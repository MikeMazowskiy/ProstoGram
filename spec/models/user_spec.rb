require 'rails_helper'
RSpec.describe User, type: :model do
  subject { build(:user1) }

  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }

  it { is_expected.to have_many(:follower_follows).with_foreign_key(:followed_user_id).class_name('Follower') }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }

  it { is_expected.to have_many(:followed_follows).with_foreign_key(:follower_id).class_name('Follower') }
  it { is_expected.to have_many(:followed_user).through(:followed_follows).source(:followed_user) }

  it { is_expected.to have_one_attached(:avatar) }

  before {  @user1 = create(:user1) }
  context "returns number of followers 0 followed 1" do
    it "users followers 0" do
      expect(@user1.reload.followers).to eq(0)
    end
    it "users followed 0" do
      expect(@user1.reload.followed).to eq(1)
    end
  end

  before {  @user2 = create(:user2) }
  let!(:follower ) {create :follower}
  context "return number of followers 1 followed 0" do
    it "users followed 1" do
      expect(@user2.reload.followed).to eq(0)
    end
    it "users followers 1" do
      expect(@user2.reload.followers).to eq(1)
    end
  end

  before {  @user3 = create(:user3) }
  context "return does user follows another user" do
    it "returns user follows true" do
      expect(@user1.follow_check(@user2, @user1)).to be_truthy
    end

    it "returns user follows false" do
      expect(@user3.follow_check(@user2, @user3)).to be_falsey
    end
  end
end
