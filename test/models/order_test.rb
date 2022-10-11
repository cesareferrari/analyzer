require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "has line items" do
    order = orders(:one)
    line_item = line_items(:one)

    assert_includes order.line_items, line_item, "Line item is not included in order"
  end

  test "sum of all orders" do
    assert_equal 11.23, Order.total_net
  end

  test "average of 2 orders" do
    # Average of net_cents column
    # 1123 cents, 2 orders, average 5.615, rounded to 5.61
    assert_equal 5.61, Order.average_net
  end

  test "average of 3 orders" do
    customers(:one).orders.create!(net_cents: 300)
    # net cents: 1423 / 3
    assert_equal 4.74, Order.average_net
  end
end
