require 'test_helper'

class GemsControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
