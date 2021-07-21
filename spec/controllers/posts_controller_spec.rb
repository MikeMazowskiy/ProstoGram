require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  let(:params) {{ user_id: user }}

  before {sign_in user}

  describe '#index' do
    subject { get :index, params: params}
    let!(:post) {create :post, user: user}

    it { is_expected.to redirect_to(home_index_path)}
  end

  describe '#show' do
    let(:params) { { user_id: user.id, id: post } }
    subject {get :show, params: params}

    let!(:post) { create :post, user: user }

    it 'assigns @post' do
      subject
      expect(assigns(:post)).to eq(post)
    end
    
    it {is_expected.to render_template(:show)}

    # context "when user tries to see someone else post " do
    #   let!(:post) { create :post }
    #
    #   it { expect {subject}.to raise_error(ActiveRecord::RecordNotFound)}
    # end
  end

  describe '#create' do
    let(:params) do
      {
        post: attributes_for(:post, user_id: user.id)
      }
    end

    subject { post :create, params: params }

    it 'create post' do
      expect { subject }.to change { Post.count }.by(1)
      is_expected.to redirect_to(home_index_path)
    end

    # context 'when params invalid' do
    #   let(:params) do
    #     { user_id: user.id, post: { image: nil } }
    #   end
    #
    #   it { is_expected.to render_template :new }
    #   it { expect {subject}.not_to change { Post.count } }
    # end
  end

  describe '#destroy' do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post, user_id: user } }

    subject { process :destroy, method: :delete, params: params }

    it 'destroy post' do
      expect { subject }.to change { Post.count }.by(-1)
      is_expected.to redirect_to(user_path(user))
    end
  end
end
