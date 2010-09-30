require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user has a role" do
    assert_kind_of Role, users(:one).role
  end
  
  test "user has a username" do
    assert true, users(:one).username
  end
  
  test "user has a crypted password" do
    assert true, users(:one).crypted_password
  end
end
