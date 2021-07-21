require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe FollowsController, type: :controller do
  let(:user) { create :user }
  let(:user2) { create :user2 }

  before {sign_in user}

  describe '#create' do
    let(:params) do
      {
        followed_user_id: user2.id,
        follower_id: user.id
      }
    end

    subject { post :create, params: params }

    it 'create follows' do
      expect { subject }.to change { Follower.count }.by(1)
      is_expected.to redirect_to(user_path(user2))
    end
  end

  describe '#destroy' do
    let!(:user) { create :user }
    let!(:user2) { create :user2 }
    let!(:following) { create :following_check}
    let(:params) { { id: following.id, user_id: user } }

    subject { process :destroy, method: :delete, params: params }

    it 'destroy post' do
      expect { subject }.to change { Follower.count }.by(-1)
      is_expected.to redirect_to(user_path(user2))
    end
  end
end

DatabaseCleaner.clean