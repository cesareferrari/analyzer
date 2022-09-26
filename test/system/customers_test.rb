require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  test "listing customers" do
    visit new_session_url

    within "#sign-in" do
      fill_in "Email", with: users(:one).email
      fill_in "Password", with: "secret"
      click_on "Sign in"
    end

    puts page.html

    # user = users(:one)
    # @request.session[:user_id] = user.id

    # visit customers_path

    click_on "Customers", match: :first

    assert_selector "h1", text: "Customers"
    assert_text customers(:one).name
    assert_text customers(:two).name
    assert_text customers(:one).username
    assert_text customers(:two).username
  end
end
