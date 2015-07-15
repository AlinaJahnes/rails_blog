module ApplicationHelper
  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end	

  def authorized?(post)
    post.user_id == session[:id]
  end
end
