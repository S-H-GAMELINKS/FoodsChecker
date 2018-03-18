require 'test_helper'

class CounttypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counttype = counttypes(:one)
  end

  test "should get index" do
    get counttypes_url
    assert_response :success
  end

  test "should get new" do
    get new_counttype_url
    assert_response :success
  end

  test "should create counttype" do
    assert_difference('Counttype.count') do
      post counttypes_url, params: { counttype: { counttype: @counttype.counttype } }
    end

    assert_redirected_to counttype_url(Counttype.last)
  end

  test "should show counttype" do
    get counttype_url(@counttype)
    assert_response :success
  end

  test "should get edit" do
    get edit_counttype_url(@counttype)
    assert_response :success
  end

  test "should update counttype" do
    patch counttype_url(@counttype), params: { counttype: { counttype: @counttype.counttype } }
    assert_redirected_to counttype_url(@counttype)
  end

  test "should destroy counttype" do
    assert_difference('Counttype.count', -1) do
      delete counttype_url(@counttype)
    end

    assert_redirected_to counttypes_url
  end
end
