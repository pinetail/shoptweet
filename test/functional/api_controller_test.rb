require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get timelines" do
    get :timelines
    assert_response :success
  end

end
