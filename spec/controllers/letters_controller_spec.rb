require 'rails_helper'

RSpec.describe LettersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:letter) { create(:letter) }
  let!(:valid_params) {{
    letter: attributes_for(:letter, url: 'http://www3.nhk.or.jp/news/html/20161216/k10010810081000.html'),
    url_params: 'https://newspicks.com/news/1939707'
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
    before do
      post :create, letter: valid_params
    end
    
    describe 'with valid_params' do
      it 'saves the new letter in the database' do
        expect {
          post :create, id: letter
        }.to change(Letter, :count).by(1)
      end

      it 'redirects to letter_path(user)' do
        expect(response).to redirect_to letter_path(user)
      end
    end

    describe 'with invalid_params' do
      it "doesn't save the new letter in the database" do
        expect {
          post :create, id: letter
        }.to change(Letter, :count).by(0)
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to root_path
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