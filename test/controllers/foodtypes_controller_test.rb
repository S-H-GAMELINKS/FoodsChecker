require 'test_helper'

class FoodtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foodtype = foodtypes(:one)
  end

  test "should get index" do
    get foodtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_foodtype_url
    assert_response :success
  end

  test "should create foodtype" do
    assert_difference('Foodtype.count') do
      post foodtypes_url, params: { foodtype: { name: @foodtype.name } }
    end

    assert_redirected_to foodtype_url(Foodtype.last)
  end

  test "should show foodtype" do
    get foodtype_url(@foodtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_foodtype_url(@foodtype)
    assert_response :success
  end

  test "should update foodtype" do
    patch foodtype_url(@foodtype), params: { foodtype: { name: @foodtype.name } }
    assert_redirected_to foodtype_url(@foodtype)
  end

  test "should destroy foodtype" do
    assert_difference('Foodtype.count', -1) do
      delete foodtype_url(@foodtype)
    end

    assert_redirected_to foodtypes_url
  end
end
