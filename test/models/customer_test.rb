require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "username is required" do
    customer = Customer.new(username: "")
    refute customer.valid?, "Username is required"
    assert customer.errors.full_messages.include?("Username can't be blank")
  end

  test "customer has a full name" do
    customer = Customer.new(first: "Jenny", last: "Smith")
    assert "Jenny Smith", customer.name
  end

  test "customer has an address" do
    customer = Customer.new(address1: "855 George Edward Via", address2: "Unit 316",
      city: "Christiansburg", state: "VA", zip: "24073", country: "United States")
    assert_equal "855 George Edward Via", customer.address1
    assert_equal "Unit 316", customer.address2
    assert_equal "Christiansburg", customer.city
    assert_equal "VA", customer.state
    assert_equal "24073", customer.zip
    assert_equal "United States", customer.country
  end
end
