require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user)   { create(:user) }
  let!(:letter) { create(:letter) }
  let!(:comment) { create(:comment) }
  let(:valid_params) {{
    id: comment,
    letter_id: letter.id,
    comment: attributes_for(:comment, content: "sample")
  }}
  let(:invalid_params) {{
    id: comment,
    letter_id: letter.id,
    comment: attributes_for(:comment, content: nil)
  }}

  before { sign_in user }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'save the new comment' do
        expect {
          post :create, valid_params
        }.to change(Comment, :count).by(1)
        expect(response).to redirect_to letter_path(letter)
      end
    end

    context 'with invalid attributes' do
      it "doesn't save a new comment" do
        expect {
          post :create, invalid_params
        }.not_to change(Comment, :count)
        expect(response).to redirect_to letter_path(letter)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the comment' do
      expect {
        delete :destroy, id: comment, letter_id: letter.id
      }.to change(Comment, :count).by(-1)
    end
  end
end
