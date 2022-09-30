require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create session" do
    user = users(:one)
    post session_url, params: {email: user.email, password: "secret"}
    assert_redirected_to dashboards_url
  end
end
