require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  setup do
     @input_attributes = {
       :name => "Lucky",
       :password => "abc",
       :password_confirmation => "abc"
     }
     
     @user = users(:one)
  end
    
  test "hashed password works" do
    user = User.new(:attributes => @input_attributes)
    user.save
    assert user.hashed_password!=nil
  end
  
  test "password assignment" do
    assert true
  end
end
