require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get sites" do
    get :sites
    assert_response :success
  end

  test "should get resources" do
    get :resources
    assert_response :success
  end

  test "should get audit" do
    get :audit
    assert_response :success
  end

  test "should get help_us" do
    get :help_us
    assert_response :success
  end

end
