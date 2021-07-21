require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe FollowersController, type: :controller do
  let(:user) { create :user }

  let(:params) { { user_id: user } }

  before {  sign_in user }

  describe '#index' do
    subject { get :index, params: params }
    let!(:user2) { create :user2 }
    let!(:following) {create :following_check}

    it 'have 0 followers' do
      subject
      expect(assigns(:followers)).to eq(0)
    end

    context 'another user followers' do
      let(:params) { { user_id: user2 } }
      subject { get :index, params: params }

      it 'have 1 followers' do
        subject
        expect(assigns(:followers)).to eq(1)
      end
    end
    it { is_expected.to render_template('index') }
  end
end

DatabaseCleaner.clean