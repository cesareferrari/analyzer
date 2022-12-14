require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit new_session_url

    within "#sign-in" do
      fill_in "Email", with: users(:one).email
      fill_in "Password", with: "secret"
      click_on "Sign in"
    end

    click_on "Products", match: :first

    assert_selector "h1", text: "Products"
    assert_text @product.name
  end

  # test "should create product" do
  #   visit products_url
  #   click_on "New product"

  #   click_on "Create Product"

  #   assert_text "Product was successfully created"
  #   click_on "Back"
  # end

  # test "should update Product" do
  #   visit product_url(@product)
  #   click_on "Edit this product", match: :first

  #   click_on "Update Product"

  #   assert_text "Product was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Product" do
  #   visit product_url(@product)
  #   click_on "Destroy this product", match: :first

  #   assert_text "Product was successfully destroyed"
  # end
end
