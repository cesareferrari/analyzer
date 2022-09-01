require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  test "listing customers" do
    visit customers_path
    assert_selector "h1", text: "Customers"
    assert_text customers(:one).name
    assert_text customers(:two).name
    assert_text customers(:one).username
    assert_text customers(:two).username
  end
end
