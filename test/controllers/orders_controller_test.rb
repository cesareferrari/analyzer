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

  test "should get show" do
    order = orders(:one)
    get order_url(id: order.id)
    assert_response :success
  end
end
