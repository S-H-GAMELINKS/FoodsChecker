require 'test_helper'

class PlacetypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @placetype = placetypes(:one)
  end

  test "should get index" do
    get placetypes_url
    assert_response :success
  end

  test "should get new" do
    get new_placetype_url
    assert_response :success
  end

  test "should create placetype" do
    assert_difference('Placetype.count') do
      post placetypes_url, params: { placetype: { name: @placetype.name } }
    end

    assert_redirected_to placetype_url(Placetype.last)
  end

  test "should show placetype" do
    get placetype_url(@placetype)
    assert_response :success
  end

  test "should get edit" do
    get edit_placetype_url(@placetype)
    assert_response :success
  end

  test "should update placetype" do
    patch placetype_url(@placetype), params: { placetype: { name: @placetype.name } }
    assert_redirected_to placetype_url(@placetype)
  end

  test "should destroy placetype" do
    assert_difference('Placetype.count', -1) do
      delete placetype_url(@placetype)
    end

    assert_redirected_to placetypes_url
  end
end
