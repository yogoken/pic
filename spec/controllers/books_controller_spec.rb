require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:user) { create(:user) }
  let(:book) { create(:book) }
  let!(:valid_params) {{
    book: attributes_for(:book, title: 'sample')
  }}

  before do
    sign_in user
  end

  context 'without login' do
    describe 'GET #index' do
      it 'returns http success' do
        get :index, user_id: user.id
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'returns http success' do
        get :new, user_id: user.id
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns http success' do
        get :show, id: book.id, user_id: user.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
