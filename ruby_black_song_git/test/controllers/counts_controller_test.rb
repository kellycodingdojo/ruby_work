require 'test_helper'

class CountsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get counts_create_url
    assert_response :success
  end

end
