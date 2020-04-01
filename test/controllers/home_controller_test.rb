require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get home_top_url
    assert_response :success
  end

  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get admin_top" do
    get home_admin_top_url
    assert_response :success
  end

  test "should get thanks" do
    get home_thanks_url
    assert_response :success
  end

end
