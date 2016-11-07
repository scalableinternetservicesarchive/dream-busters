require 'test_helper'

class EditorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get editors_show_url
    assert_response :success
  end

end
