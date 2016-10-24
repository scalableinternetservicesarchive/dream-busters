require 'test_helper'

class EditorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get editor_show_url
    assert_response :success
  end

end
