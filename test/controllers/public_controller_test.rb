require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get wall" do
    get :wall
    assert_response :success
  end

end
