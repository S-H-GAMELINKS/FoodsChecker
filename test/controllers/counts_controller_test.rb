require 'test_helper'

class CountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @count = counts(:one)
  end

  test "should get index" do
    get counts_url
    assert_response :success
  end

  test "should get new" do
    get new_count_url
    assert_response :success
  end

  test "should create count" do
    assert_difference('Count.count') do
      post counts_url, params: { count: { count: @count.count } }
    end

    assert_redirected_to count_url(Count.last)
  end

  test "should show count" do
    get count_url(@count)
    assert_response :success
  end

  test "should get edit" do
    get edit_count_url(@count)
    assert_response :success
  end

  test "should update count" do
    patch count_url(@count), params: { count: { count: @count.count } }
    assert_redirected_to count_url(@count)
  end

  test "should destroy count" do
    assert_difference('Count.count', -1) do
      delete count_url(@count)
    end

    assert_redirected_to counts_url
  end
end
