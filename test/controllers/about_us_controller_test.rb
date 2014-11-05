require 'test_helper'

class AboutUsControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :index
    assert_response :success
  end

end
