require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "has line items" do
    order = orders(:one)
    line_item = line_items(:one)

    assert_includes order.line_items, line_item, "Line item is not included in order"
  end
end
