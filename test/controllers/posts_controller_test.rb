require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'exists url posts index' do
    get posts_url
    assert_response :success
  end

  test 'exists url posts show' do
    get post_url(1)
  end

  test 'exists url posts new' do
    get new_post_url
  end

  test 'exists url posts create' do
    get posts_url
    assert_response :success
  end

  test 'exists url posts destroy' do
    delete post_path(:one)
  end
end
