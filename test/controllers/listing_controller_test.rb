require "test_helper"

class ListingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listing_index_url
    assert_response :success
  end

  test "should get show" do
    get listing_show_url
    assert_response :success
  end

  test "should get create" do
    get listing_create_url
    assert_response :success
  end

  test "should get update" do
    get listing_update_url
    assert_response :success
  end

  test "should get delete" do
    get listing_delete_url
    assert_response :success
  end
end
