require 'rails_helper'

RSpec.describe User, type: :model do
  context "create a new user" do
    it "ask for a username" do
      user = User.create(:username => nil)
      expect(user).to_not be_valid
    end

    it "save a unique username" do
      user = User.create(:username => "Mar")
      user2 = User.create(:username => "Mar")
      expect(user2).to_not be_valid
    end
    
    it "save username data" do
      user = User.create(:username => "Mar")
      expect(user.username).to eq('Mar')
      expect(user.username).not_to eq('Dany')
    end
  end
end