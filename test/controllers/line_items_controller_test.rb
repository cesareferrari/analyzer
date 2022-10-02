require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # log in admin
    user = users(:one)
    post session_url, params: {email: user.email, password: "secret"}
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end
end
