require 'rails_helper'

RSpec.describe "searches/index", type: :view do
  before(:each) do
    user = User.create(username: "Jenny")
    assign(:searches, [
      Search.create(title: "test", user_id: user.id),
      Search.create(title: "test2", user_id: user.id)
    ])
  end

  it "renders a list of searches" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
