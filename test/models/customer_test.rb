require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "name is required" do
    customer = Customer.new(name: "")
    refute customer.valid?, "Name is required"
    assert customer.errors.full_messages.include?("Name can't be blank")
  end

  test "username is required" do
    customer = Customer.new(username: "")
    refute customer.valid?, "Username is required"
    assert customer.errors.full_messages.include?("Username can't be blank")
  end
end
