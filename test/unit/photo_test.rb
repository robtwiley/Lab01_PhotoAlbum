require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

 test "Photos are created" do
    assert_not_nil  photos(:one)
    assert_not_nil  photos(:two)
  end
  
  test "Photos have locations" do
    assert photos(:one).location.length > 0
    assert photos(:two).location.length > 0
  end
  
  test "Photos have title" do
    assert photos(:one).title.length > 0
    assert photos(:two).title.length > 0
  end
  
end
