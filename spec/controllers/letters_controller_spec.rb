require 'rails_helper'

RSpec.describe LettersController, type: :controller do
  let!(:user)   { create(:user) }
  let!(:letter) { create(:letter) }
  let(:comment) { create(:comment) }
  let(:valid_params) {{
    url: 'http://www3.nhk.or.jp/news/html/20161216/k10010810081000.html'
  }}
  let(:invalid_params) {{
    url: nil
  }}

  before { sign_in user }

  shared_examples_for 'valid responses' do |template|
    it { expect(response.status).to eq 200 }
    it { expect(response).to render_template template }
  end

  describe 'GET #index' do
    before { get :index }
    it_behaves_like 'valid responses', :index
    it { expect(assigns(:letters)).to include letter }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new letter' do
        expect {
          post :create, valid_params
        }.to change(Letter, :count).by(1)
        expect(response).to redirect_to letter_path(Letter.last)
        expect(flash[:notice]).to eq '投稿に成功しました'
      end
    end

    context 'with invalid attributes' do
      it "doesn't save a new letter" do
        expect {
          post :create, invalid_params
        }.not_to change(Letter, :count)
        expect(response).to redirect_to root_url
        expect(flash[:alert]).to eq '投稿に失敗しました'
      end
    end
  end

  describe 'GET #show' do
    before { get :show, id: letter }
    it_behaves_like 'valid responses', :show
    it { expect(assigns(:letter)).to eq letter } 
    it { expect(assigns(:comment)).to be_a_new(Comment) }
    it { expect(assigns(:create_storage)).to be_a_new(Storage) }
  end

  describe 'DELETE #destroy' do
    it 'deletes the letter' do
      expect{
        delete :destroy, id: letter
      }.to change(Letter, :count).by(-1)
    end

    it 'redirects to root_path' do
      delete :destroy, id: letter
      expect(response).to redirect_to root_url
    end
  end
end