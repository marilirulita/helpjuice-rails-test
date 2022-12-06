require 'rails_helper'

RSpec.describe "/searches", type: :request do
  
  let(:user) { User.create(username: "Jenny")  } 
  let(:valid_attributes) {
    {title: "test", user_id: user.id}
  }

  let(:invalid_attributes) {
    {title: nil, user_id: user.id}
  }

  describe "GET /index" do
    it "renders a successful response" do
      user.searches.create! valid_attributes
      get searches_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      search = user.searches.create! valid_attributes
      get search_url(search)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_search_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Search" do
        expect {
          post searches_url, params: { search: valid_attributes }
        }.to change(Search, :count).by(1)
      end

      it "redirects to the created search" do
        post searches_url, params: { search: valid_attributes }
        expect(response).to redirect_to(search_url(Search.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Search" do
        expect {
          post searches_url, params: { search: invalid_attributes }
        }.to change(Search, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post searches_url, params: { search: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested search" do
      search = user.searches.create! valid_attributes
      expect {
        delete search_url(search)
      }.to change(Search, :count).by(-1)
    end

    it "redirects to the searches list" do
      search = user.searches.create! valid_attributes
      delete search_url(search)
      expect(response).to redirect_to(searches_url)
    end
  end
end
