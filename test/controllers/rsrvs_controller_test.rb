require 'test_helper'

class RsrvsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rsrvs_show_url
    assert_response :success
  end

end
