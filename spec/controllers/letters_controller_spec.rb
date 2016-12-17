require 'rails_helper'

RSpec.describe LettersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:letter) { create(:letter) }
  let!(:valid_params) {{
    url: 'http://www3.nhk.or.jp/news/html/20161216/k10010810081000.html'
  }}
  let!(:invalid_params) {{
    url: 'http://www.newsweekjapan.jp/stories/world/2016/12/post-6558.php'
  }}

  before do
    sign_in user
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'assigns the requested letter to @letters' do
      expect(assigns(:letters)).to include letter
    end

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'render template :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new letter' do
        expect {
          post :create, valid_params
        }.to change(Letter, :count).by(1)
      end

      it 'redirect_to letter_path' do
        expect(response).to redirect_to letter_path(user)
      end

      it 'show a flash message, success to create letter' do
        expect(flash[:notice]).to eq '投稿に成功しました'
      end
    end

    context 'with invalid attributes' do
      it "doesn't save a new letter" do
        expect {
          post :create, invalid_params
        }.not_to change(Letter, :count)
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to root_path
      end

      it 'show a flash message, failed to create letter' do
        expect(flash[:alert]).to eq '投稿に失敗しました'
      end
    end
  end

  describe 'GET #show' do
    before do
      get :show, id: letter.id
    end

    it 'assigns the requested letter to @letter' do
      expect(assigns(:letter)).to eq letter
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    before do
      @letter = create(:letter)
    end

    it 'deletes the letter' do
      expect{
        delete :destroy, id: @letter
      }.to change(Letter, :count).by(-1)
    end

    it 'redirects to root_path' do
      delete :destroy, id: @letter
      expect(response).to redirect_to root_url
    end
  end
end