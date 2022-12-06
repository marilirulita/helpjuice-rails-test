require 'rails_helper'

RSpec.describe "searches/new", type: :view do
  before(:each) do
    user = User.create(username: "Jenny")
    assign(:search, Search.new(title: "test", user_id: user.id))
  end

  it "renders new search form" do
    render

    assert_select "form[action=?][method=?]", searches_path, "post" do
    end
  end
end
