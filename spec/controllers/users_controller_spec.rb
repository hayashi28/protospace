require 'rails_helper'

describe UsersController do
  context 'with user login' do
    login_user
    let(:user){ create(:user) }

    describe 'GET #show' do
      it 'assigns the requested to @user' do
        get :show, id: user
        expect(assigns(:user)).to eq user
      end
      it 'renders the :show templates' do
        get :show, id: user
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      login_user
      it 'assigns the requested user to @user' do
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit template' do
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      it 'assigns the requested user to @user' do
        patch :update, id: user, user: attributes_for(:user)
        expect(assigns(:user)).to eq user
      end

      it "changes @user's attributes" do
        patch :update, id: user, user: attributes_for(:user, nickname: 'hayashi')
        user.reload
        expect(user.nickname).to eq 'hayashi'
      end

      it 'redirects root path' do
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end

      it 'sends flash messages' do
        patch :update, id: user, user: attributes_for(:user, name: 'hoge')
        expect(flash[:notice]).to eq('Successfully update user.')
      end
    end
  end

  context 'without user login' do
    let(:user){ create(:user) }
    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
