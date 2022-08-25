require "test_helper"

class WelcomeTest < ActionDispatch::IntegrationTest
  test "welcome page" do
    get "/welcome"
    assert_select "h1", text: /etsy\s*analyzer/i
  end

  test "welcome page is root path" do
    get "/"
    assert_select "h1", text: /etsy\s*analyzer/i
  end
end
