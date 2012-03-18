require 'test_helper'

class GroundtruthControllerTest < ActionController::TestCase
  test "should get answer" do
    get :answer
    assert_response :success
  end

end
