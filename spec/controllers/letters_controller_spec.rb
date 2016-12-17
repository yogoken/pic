require 'rails_helper'

RSpec.describe LettersController, type: :controller do
  let!(:letter) { create(:letter) }
  let(:valid_params) {{
    id: letter.id,
    letter: attributes_for(:letter, title: 'hoge')
  }}
  let(:invalid_params) {{
    id: user.id,
    letter: attributes_for(:letter, title: nil)
  }}

  before do
    http_login
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
end