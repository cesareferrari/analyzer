require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # log in admin
    user = users(:one)
    post session_url, params: {email: user.email, password: "secret"}
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end
end
