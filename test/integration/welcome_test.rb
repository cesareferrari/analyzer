require "test_helper"

class WelcomeTest < ActionDispatch::IntegrationTest
  test "welcome page" do
    get "/welcome"
    assert_select "h2", text: /analyzer/i
  end

  test "welcome page is root path" do
    get "/"
    assert_select "h2", text: /analyzer/i
  end
end
