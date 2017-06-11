require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  before do
    @user = create(:user)
    @secret = create(:secret, user: @user)
    @like = create(:like, secret: @secret, user: @user)
  end
  context "when not logged in " do
    before do
      session[:user_id] = nil
    end
    it "cannot create a like" do
      @secret = Secret.find(params[:id])
      post :create, params: {id: @secret.id}
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot destroy a like" do
      @like = Like.find(params[:id])
      delete :destroy, params: {id: @like.id}
      expect(response).to redirect_to("/sessions/new")
    end
  end
end
