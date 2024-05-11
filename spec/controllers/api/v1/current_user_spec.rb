# frozen_string_literal: true

require 'rails_helper'
require 'byebug'

RSpec.describe Api::V1::CurrentUserController, type: :controller do

  describe "GET #index" do
    let(:user) { create(:user) }

    it "returns a success response" do
      sign_in user
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns a JSON response with the current user" do
      sign_in user
      get :index
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end