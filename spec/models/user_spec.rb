require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to have_many(:posts) }

  it { is_expected.to have_many(:follower_follows).with_foreign_key(:followed_user_id).class_name('Follower') }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }

  it { is_expected.to have_many(:followed_follows).with_foreign_key(:follower_id).class_name('Follower') }
  it { is_expected.to have_many(:followed_user).through(:followed_follows).source(:followed_user) }

  it { is_expected.to have_one_attached(:avatar)}
end
