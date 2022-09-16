require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product is valid with default attributes" do
    product = products(:one)
    assert product.valid?
  end

  test "product is invalid without a name" do
    product = products(:one)
    product.name = ""
    assert product.invalid?
  end

  test "product is invalid without a price" do
    product = products(:one)
    product.price_cents = nil
    assert product.invalid?
  end

  test "price must be an integer" do
    product = products(:one)
    product.price_cents = "1.99"
    assert product.invalid?

    product.price_cents = 1.99
    assert product.invalid?
  end

  test "product is invalid without a listing id" do
    product = products(:one)
    product.listing_id = nil
    assert product.invalid?
  end

  test "product is invalid without a unique listing id" do
    product_one = products(:one)
    product_two = products(:two)
    product_one.listing_id = product_two.listing_id
    assert product_one.invalid?
  end

  test "price in dollars" do
    product = products(:one)
    assert_equal 1.99, product.price
  end
end
