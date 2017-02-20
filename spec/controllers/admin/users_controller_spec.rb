require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  let!(:user) { create(:user) }
  let(:valid_params) {
    {
    id: user.id,
    user: attributes_for(:user, nickname: "hoge")
  }}
  let(:invalid_params) {
    {
    id: user.id,
    user: attributes_for(:user, nickname: nil)
  }}

  describe "with user login" do
    login_user
    describe "GET #index" do
      before do
        get :index
      end

      it "assigns the requested user to @users" do
        expect(assigns(:users)).to include user
      end

      it "returns 200" do
        expect(response.status).to eq 200
      end

      it "render template :index template" do
        expect(response).to render_template :index
      end
    end
  end
end
