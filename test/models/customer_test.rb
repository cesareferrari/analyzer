require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "username is required" do
    customer = Customer.new(username: "")
    refute customer.valid?, "Username is required"
    assert customer.errors.full_messages.include?("Username can't be blank")
  end
end
