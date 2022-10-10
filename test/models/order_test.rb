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
end
