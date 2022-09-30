require "application_system_test_case"

class LoginUsersTest < ApplicationSystemTestCase
  test "logging in a user" do
    visit new_session_url

    within "#sign-in" do
      fill_in "Email", with: users(:one).email
      fill_in "Password", with: "secret"
      click_on "Sign in"
    end

    assert_selector "h2", text: "Customers"
    assert_selector "h2", text: "Products"
    assert_selector "h2", text: "Orders"
  end
end
