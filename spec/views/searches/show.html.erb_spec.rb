require 'rails_helper'

RSpec.describe "searches/show", type: :view do
  before(:each) do
    user = User.create(username: "Jenny")
    assign(:search, Search.create(title: "test", user_id: user.id))
  end

  it "renders attributes in <p>" do
    render
  end
end
