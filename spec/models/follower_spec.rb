require 'rails_helper'

RSpec.describe Follower, type: :model do

  it { is_expected.to belong_to(:follower).with_foreign_key(:follower_id).class_name('User') }
  it { is_expected.to belong_to(:followed_user).with_foreign_key(:followed_user_id).class_name('User') }

  it { is_expected.to validate_uniqueness_of(:follower_id).scoped_to(:followed_user_id)}

end
