require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_comments_new_url
    assert_response :success
  end

end
