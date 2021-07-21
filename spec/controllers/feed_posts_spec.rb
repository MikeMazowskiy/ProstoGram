require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe FeedPostsController, type: :controller do
  let(:user) { create :user }
  let(:params) { { user_id: user } }

  before {  sign_in user }

  describe '#index' do
    subject {get :index, params: params}

    context 'when user have not followings' do
      it 'assigns @posts' do
        subject
        expect(assigns(:posts)).to eq(nil)
      end
    end

    it { is_expected.to render_template('index') }
  end
end

DatabaseCleaner.clean