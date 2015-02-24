require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
