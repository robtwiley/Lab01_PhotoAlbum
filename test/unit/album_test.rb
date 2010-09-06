require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  
  test "Albums are created" do
    assert_not_nil  albums(:one)
    assert_not_nil  albums(:two)
  end
  
  test "Albums have titles" do
    assert albums(:one).title.length > 0
    assert albums(:two).title.length > 0
  end
  
  test "Albums have descriptions" do
    assert albums(:one).description.length > 0
    assert albums(:two).description.length > 0
  end
  
  test "Albums have photos" do
    assert_kind_of Array, albums(:one).photos
  end
  
  
end #end class AlbumTest unit tests

