require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email is required" do
    user = users(:one)
    user.email = ""
    refute user.valid?
  end

  test "email is unique" do
    user = users(:one)
    user.email = "cesare@example.com" # same as user two
    refute user.valid?
  end

  test "email uniqueness is case insensitive" do
    user = users(:one)
    user.email = "CESARE@example.com" # same as user two but different case
    refute user.valid?
  end
end
