require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "requires items in cart" do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end
end
