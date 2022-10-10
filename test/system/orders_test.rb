require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
    @line_item = line_items(:one)
  end

  test "order has line items" do
    visit new_session_url

    within "#sign-in" do
      fill_in "Email", with: users(:one).email
      fill_in "Password", with: "secret"
      click_on "Sign in"
    end

    click_on "Orders", match: :first

    click_on "View order", match: :first

    assert_text @order.etsy_order_id
    assert_text @line_item.product.name
  end
end
