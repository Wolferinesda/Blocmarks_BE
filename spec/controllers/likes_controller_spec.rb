require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:my_bookmark) { create(:bookmark, user: my_user) }

  describe "GET #index" do
    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST create" do
    it "redirects to the topics view " do
      post :create, params: { bookmark_id: my_bookmark.id }
      expect(response).to have_http_status(:success)
    end
  end

end
