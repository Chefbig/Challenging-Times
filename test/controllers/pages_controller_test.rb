require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get lizard" do
    get pages_lizard_url
    assert_response :success
  end

end
