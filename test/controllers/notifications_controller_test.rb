require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get notifications_index_url
    assert_response :success
  end

  test "should get update" do
    get notifications_update_url
    assert_response :success
  end
end
