module PostsHelper
  def offset(page = 1, posts_on_page = 10)
    (page - 1) * posts_on_page
  end

  def pages(posts_on_page = 10)
    return (posts_count + posts_on_page - 1) / posts_on_page if posts_on_page.positive?

    0
  end

  def page_values(pages)
    return (1..pages).to_a if pages <= 5
  end

  private

  def posts_count
    Post.count
  end
end
