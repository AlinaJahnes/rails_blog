module PostsHelper
  def authorized?(post)
    post.user_id == session[:id]
  end
end
