require 'rails_helper'

RSpec.describe Search, type: :model do
  context "create a new search" do
    it "ask for a title" do
      user = User.create(:username => "Mar")
      search = user.searches.create(:title => nil)
      expect(search).to_not be_valid
    end

    it "save a unique title" do
      user = User.create(:username => "Mar")
      search = user.searches.create(:title => "hello")
      search2 = user.searches.create(:title => "hello")
      expect(search2).to_not be_valid
    end
    
    it "save search title data" do
      search = Search.create(:title => "New Search")
      expect(search.title).to eq('New Search')
      expect(search.title).not_to eq('Old Search')
    end
  end
end


  
