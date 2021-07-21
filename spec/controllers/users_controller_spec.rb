require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  let(:params) { { user_id: user } }

  before {sign_in user}

  describe '#show' do
    let(:params) { { id: user } }

    subject { get :show, params: params }

    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq(user)
    end

    it { is_expected.to render_template(:show) }
  end

  describe '#edit' do
    let(:params) { { id: user } }

    subject { process :edit, method: :get, params: params }

    it { is_expected.to render_template(:edit) }

    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns server policy' do
      subject
      expect(assigns :user).to eq user
    end
  end

  describe '#update' do
    let(:params) { { id: user, user: { name: 'changed name',
                                       username: 'changed username',
                                       bio: 'changed bio',
                                       gender: 'changed gender',
                                       website: 'changed website' } } }

    subject { process :update, method: :put, params: params }

    it { is_expected.to redirect_to(user) }

    it 'updates user profile' do
      expect { subject }.to change { user.reload.name }.to('changed name')
    end
    it 'updates user profile' do
      expect { subject }.to change { user.reload.username }.to('changed username')
    end
    it 'updates user profile' do
      expect { subject }.to change { user.reload.bio }.to('changed bio')
    end
    it 'updates user profile' do
      expect { subject }.to change { user.reload.gender }.to('changed gender')
    end
    it 'updates user profile' do
      expect { subject }.to change { user.reload.website }.to('changed website')
    end

    context 'with nil email' do
      let(:params) { { id: user, user: { email: '' } } }

      it 'does not update user profile' do
        expect { subject }.not_to change { user.reload.name }
      end
    end
  end
end

DatabaseCleaner.clean