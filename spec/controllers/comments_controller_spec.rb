require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'comments#create action' do
    it 'allows users to create comments for grams in the database' do
      gram = FactoryGirl.create(:gram)
      user = FactoryGirl.create(:user)
      sign_in user
      post :create, params: { gram_id: gram.id, user_id: user.id, comment: { message: 'awesome gram' } }
      expect(response).to redirect_to root_path
      expect(gram.comments.length).to eq 1
      expect(gram.comments.first.message).to eq('awesome gram')
    end

    it 'requires a user to be logged in to comment on a gram' do
      gram = FactoryGirl.create(:gram)
      post :create, params: { gram_id: gram.id, comment: { message: 'awesome gram' } }
      expect(response).to redirect_to new_user_session_path
    end

    it "returns http status code of not found if the gram isn't found" do
      user = FactoryGirl.create(:user)
      sign_in user
      post :create, params: { gram_id: 'NEVERAGRAM', comment: { message: 'awesome gram' } }
      expect(response).to have_http_status(:not_found)
    end
  end
end
